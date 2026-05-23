#!/usr/bin/env node
/**
 * wiki-atlas-rebuild.js
 * Scan toàn bộ vault .md files → rebuild obsidian_atlas.json
 *
 * Usage:
 *   node rebuild.js --vault <vault_root> --output <atlas.json>
 *
 * Defaults (HRM setup):
 *   vault:  C:\Code\HRM-AGENT-AI\HRM-WIKI\obs-Notes-Networking\HRM-Knowledge-Base
 *   output: C:\Code\HRM-AGENT-AI\obsidian_atlas.json
 */

const fs = require("fs");
const path = require("path");

// ── Config ──────────────────────────────────────────────────────────────────
const args = process.argv.slice(2);
const getArg = (flag) => {
  const i = args.indexOf(flag);
  return i !== -1 ? args[i + 1] : null;
};

const VAULT_ROOT =
  getArg("--vault") ||
  "C:\\Code\\HRM-AGENT-AI\\HRM-WIKI\\obs-Notes-Networking\\HRM-Knowledge-Base";

const OUTPUT =
  getArg("--output") || "C:\\Code\\HRM-AGENT-AI\\Tools\\obsidian_atlas.json";

// ── Helpers ──────────────────────────────────────────────────────────────────

/** Walk directory recursively, yield all .md file absolute paths */
function* walkMd(dir) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      yield* walkMd(full);
    } else if (entry.isFile() && entry.name.endsWith(".md")) {
      yield full;
    }
  }
}

/** Extract [[link]] or [[link|alias]] targets from markdown content */
function extractLinks(content) {
  const links = new Set();
  const regex = /\[\[([^\]|#]+)(?:[|#][^\]]+)?\]\]/g;
  let m;
  while ((m = regex.exec(content)) !== null) {
    // Normalize: trim, replace backslash → forward slash, remove .md extension
    let target = m[1].trim().replace(/\\/g, "/").replace(/\.md$/i, "");
    if (target) links.add(target);
  }
  return [...links];
}

/** Relative path from vault root, using forward slash */
function relPath(absPath) {
  return path.relative(VAULT_ROOT, absPath).replace(/\\/g, "\\");
}

/** Node id = filename without .md */
function nodeId(absPath) {
  return path.basename(absPath, ".md");
}

// ── Main ────────────────────────────────────────────────────────────────────

console.log(`📂 Vault  : ${VAULT_ROOT}`);
console.log(`📄 Output : ${OUTPUT}`);
console.log("🔍 Scanning...\n");

if (!fs.existsSync(VAULT_ROOT)) {
  console.error(`❌ Vault not found: ${VAULT_ROOT}`);
  process.exit(1);
}

// Pass 1: build id → node map + collect links_to
const nodeMap = new Map(); // id → { id, path, links_to, backlinks }

let total = 0;
for (const absPath of walkMd(VAULT_ROOT)) {
  const id = nodeId(absPath);
  const rel = relPath(absPath);
  const content = fs.readFileSync(absPath, "utf-8");
  const links = extractLinks(content);

  nodeMap.set(id, { id, path: rel, links_to: links, backlinks: [] });
  total++;
}

console.log(`   Found ${total} .md files`);

// Pass 2: build backlinks (reverse index)
// backlink target can be id or path-like — try both
for (const [sourceId, node] of nodeMap) {
  for (const target of node.links_to) {
    // target may be "wiki/projects/Foo" or just "Foo"
    const targetId = path.basename(target); // last segment = filename
    if (nodeMap.has(targetId)) {
      nodeMap.get(targetId).backlinks.push(target);
    }
  }
}

// Deduplicate backlinks
for (const node of nodeMap.values()) {
  node.backlinks = [...new Set(node.backlinks)];
}

// Serialize
const atlas = [...nodeMap.values()];
fs.writeFileSync(OUTPUT, JSON.stringify(atlas, null, 2), "utf-8");

const withLinks = atlas.filter((n) => n.links_to.length > 0 || n.backlinks.length > 0).length;
const orphans = atlas.length - withLinks;

console.log(`\n✅ Done!`);
console.log(`   Total nodes  : ${atlas.length}`);
console.log(`   Has links    : ${withLinks}`);
console.log(`   Orphans      : ${orphans}`);
console.log(`   Output       : ${OUTPUT}`);
console.log(`\n⚡ Next: call wiki_atlas_reload MCP to load new atlas into memory`);
