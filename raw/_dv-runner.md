---
tags: [_tool, _dv-runner]
---

# Dataview Runner

> Note tool — DataviewJS đọc query JSON và ghi kết quả. **Không xóa, không sửa.**

```dataviewjs
const queryFile = "raw/_dv-query.json";
const resultFile = "raw/_dv-result.json";

async function run() {
    let raw;
    try { raw = await app.vault.adapter.read(queryFile); }
    catch(e) { return; }

    let req;
    try { req = JSON.parse(raw); } catch(e) { return; }

    // Tránh chạy lại nếu reqId đã xử lý
    try {
        const prev = JSON.parse(await app.vault.adapter.read(resultFile));
        if (prev._reqId === req._reqId) return;
    } catch(e) {}

    const { query, filter = {}, dql } = req;
    const {
        folder,
        excludeFolders = [],
        tags = [],
        limit = 500
    } = filter;

    // Helper: lọc file theo filter
    function applyFilter(files) {
        let result = files;
        if (folder) result = result.filter(f => f.path.startsWith(folder));
        if (excludeFolders.length) result = result.filter(f => !excludeFolders.some(ex => f.path.startsWith(ex)));
        if (tags.length) result = result.filter(f => {
            const fm = app.metadataCache.getFileCache(f)?.frontmatter?.tags || [];
            const fileTags = Array.isArray(fm) ? fm : [fm];
            return tags.some(t => fileTags.includes(t));
        });
        return result.slice(0, limit);
    }

    const allFiles = app.vault.getMarkdownFiles();
    const result = { _reqId: req._reqId, query, ts: new Date().toISOString() };

    // ── ORPHANS ──
    if (query === "orphans") {
        // Build linked set chỉ trong scope filter
        const scopeFiles = applyFilter(allFiles);
        const linkedPaths = new Set();

        for (const f of scopeFiles) {
            const links = app.metadataCache.getFileCache(f)?.links || [];
            for (const l of links) {
                const target = app.metadataCache.getFirstLinkpathDest(l.link, f.path);
                if (target) linkedPaths.add(target.path);
            }
        }

        const orphans = scopeFiles
            .filter(f => {
                const backlinks = Object.keys(app.metadataCache.getBacklinksForFile(f)?.data || {});
                // chỉ tính backlink từ trong scope
                const scopePaths = new Set(scopeFiles.map(x => x.path));
                const inScopeBacklinks = backlinks.filter(b => scopePaths.has(b));
                return !linkedPaths.has(f.path) && inScopeBacklinks.length === 0;
            })
            .map(f => ({ path: f.path }));

        result.data = orphans;
        result.count = orphans.length;
    }

    // ── BROKEN LINKS ──
    else if (query === "broken_links") {
        const scopeFiles = applyFilter(allFiles);
        const broken = [];

        for (const f of scopeFiles) {
            const links = app.metadataCache.getFileCache(f)?.links || [];
            for (const l of links) {
                const target = app.metadataCache.getFirstLinkpathDest(l.link, f.path);
                if (!target) broken.push({ source: f.path, link: l.link });
            }
        }

        result.data = broken.slice(0, limit);
        result.count = broken.length;
    }

    // ── FRONTMATTER ──
    else if (query === "frontmatter") {
        const scopeFiles = applyFilter(allFiles);
        result.data = scopeFiles.map(f => ({
            path: f.path,
            frontmatter: app.metadataCache.getFileCache(f)?.frontmatter || {}
        }));
        result.count = result.data.length;
    }

    // ── GRAPH EDGES ──
    else if (query === "graph_edges") {
        const scopeFiles = applyFilter(allFiles);
        const edges = [];

        for (const f of scopeFiles) {
            const links = app.metadataCache.getFileCache(f)?.links || [];
            for (const l of links) {
                const target = app.metadataCache.getFirstLinkpathDest(l.link, f.path);
                edges.push({ source: f.path, target: target?.path || null, link: l.link, broken: !target });
            }
        }

        result.data = edges.slice(0, limit);
        result.count = edges.length;
    }

    // ── DQL ──
    else if (query === "dql" && dql) {
        try {
            const res = await dv.query(dql);
            result.data = res.successful ? res.value : null;
            result.error = res.successful ? null : res.error;
            result.count = res.successful ? (res.value?.values?.length ?? 0) : 0;
        } catch(e) {
            result.error = e.message;
        }
    }

    else {
        result.error = "Unknown query: " + query;
    }

    await app.vault.adapter.write(resultFile, JSON.stringify(result, null, 2));
    dv.el("div", `✅ ${query} | ${result.count ?? "?"} items | filter: ${JSON.stringify(filter)} | ${result.ts}`);
}

// Auto-poll mỗi 2 giây
run();
const interval = setInterval(run, 2000);

// Cleanup khi note bị đóng/re-render
if (typeof this?.register === "function") {
    this.register(() => clearInterval(interval));
}
```
