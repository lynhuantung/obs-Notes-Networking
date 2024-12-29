---
aliases:
  - bỏ checkout file EnumConstant của Phi.Ngo
date: 2024-06-26
tags:
  - "#new_note"
  - "#tfs_cmd"
---

### Hỗ trợ bỏ checkout file EnumConstant của Phi.Ngo

<p align="left"><p align="justify">Unable to perform operation on $/HRM9/Branch-Source/Main-branchpassv8.7.25.01SMV/Source/Infrastructure/HRM.Infrastructure.Utilities/Enum/EnumConstant.cs. The item $/HRM9/Branch-Source/Main-branchpassv8.7.25.01SMV/Source/Infrastructure/HRM.Infrastructure.Utilities/Enum/EnumConstant.cs is locked in workspace CPU28;phi.ngo.
</p>
</p>

----------------- test -----------
 tf status /workspace:"CPU28;phi.ngo" /collection:"http://172.21.35.2:8080/tfs/DefaultCollection"

tf undo /workspace:"CPU28;phi.ngo" /collection:"http://172.21.35.2:8080/tfs/DefaultCollection" "$/HRM9/Branch-Source/Main-branch_pass_v8.7.25.01_SMV/Source/Infrastructure/HRM.Infrastructure.Utilities/Enum/EnumConstant.cs"   