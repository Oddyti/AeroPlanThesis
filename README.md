# AeroPlanThesis — 浙江大学硕/博学位论文 LaTeX 模板（课题组专用）

## 1. 项目说明

AeroPlanThesis 是浙江大学研究生（硕士/博士）学位论文 LaTeX 模板，由 **oddyti** 在开源项目
[zjuthesis](https://github.com/TheNetAdmin/zjuthesis)（浙江大学学位论文 LaTeX 模板，作者 Zixuan Wang，
MIT 协议）**v10.0.1** 基础上二次开发，**仅供课题组内部使用，请勿对外分发**。

### 1.1 相对原模板改动

- **移除本科生支持**：删除本科页面（开题/期中/答辩等）、`config/format/major/ee/` 及各处
  `Degree = undergraduate` 分支，入口固定为研究生流程，仅保留硕士（master）/ 博士（doctor）
- **保留/沿用研究生功能**：学术学位 / 专业学位（`Type`）、盲审模式（`BlindReview`）、专业格式覆盖等
- **新增硕博开题报告模式**：`Period = proposal` 时输出“首页封面 + 目录 + 正文 + 参考文献”的开题版
- **数学排版**：`unicode-math` + XITS Math，公式字体更贴近 Times New Roman
- **参考文献**：样式更新到新版国标 GB/T 7714-2025（需 TeX Live 2026+，见 §2.1）
- **修订标记**：`\rev{}`（中文/混排）与 `\revEN{}`（纯英文），由总开关一键控制
- 调整部分页面与版式，更贴合硕士论文写作


## 2. 使用说明

### 2.1 环境要求

> 模板的二次开发全程在 **macOS** 上编写与验证（LaTeX 代码本身跨平台，但 `build.sh` 等工具脚本为macOS/bash 方向，**未适配 Windows**）；使用 Windows 平台的师弟师妹如果遇到相关问题的请压榨AI搞定（见 §2.2）。

- **TeX Live 2026 或更新版本**（推荐）：本模板参考文献采用新国标样式 `biblatex` `style=gb7714-2025`（GB/T 7714-2025），
  该样式需宏包 `biblatex-gb7714-2015` 在 **2025 年下半年及以后**的版本（其中才包含 `gb7714-2025.bbx/cbx`），
  TeX Live 2025 及更早版本默认**不含**该样式，TeX Live 2026 起随发行版内置
- 若使用 TeX Live 2025 或更早：请先更新宏包，确保能识别 `gb7714-2025` 样式，否则编译会报样式/选项找不到：
  ```bash
  tlmgr update --self && tlmgr update biblatex biblatex-gb7714-2015 biber
  ```
  仍不行时，可从 <https://www.ctan.org/pkg/biblatex-gb7714-2015> 下载样式文件放入本地 `texmf` 树
- MiKTeX 用户：保持宏包自动更新（`biblatex-gb7714-2015`、`biblatex`、`biber`）即可
- 编译需要 XeTeX 与 biber（由 `latexmk` 自动调用）
- macOS：使用系统中文字体（Songti SC 等，模板自动适配 mac/macnew fontset）
- Windows/Linux：SimSun 等中文字体，如缺失请按需配置 `config/format/general/fonts.tex`
- 校内安装可参考浙江大学镜像：<https://mirrors.zju.edu.cn/docs/CTAN>
- 编辑器推荐：使用 **TeX Live 引擎 + VSCode** 的组合写论文（VSCode 装 **LaTeX Workshop** 插件，编译命令直接调 `latexmk`）。
  TeX Live 自带的官方编辑器（TeXworks / TeXShop 等）不好用，不建议；相关环境配置教程网上很多，搜「VSCode + LaTeX」即可

### 2.2 编译

在项目根目录执行：

```bash
./build.sh                 # 推荐：清理并编译，输出 out/zjuthesis.pdf
# 等价于：
latexmk -xelatex -outdir=out zjuthesis
```

- Overleaf 用户：上传整个项目（不含 `out/`），编译器选择 **XeLaTeX**，并按提示上传所需字体
- 必须使用 `latexmk`（或 `./build.sh`）编译，参考文献（biber）才会被正确处理
- Windows 用户：本仓库未提供 Windows 原生脚本（平台说明见 §2.1），请在 Git Bash / WSL 中运行 `./build.sh`，
  或自行（可用 AI）按上方等价的 `latexmk` 命令改写一份可用的脚本
- **遇到安装/使用问题**：本模板是在原项目 zjuthesis 基础上的精简二次开发，大部分问题（字体、TeX Live、
  Overleaf、参考文献样式等）在原项目及其 issue 中已有讨论与解答，建议优先查阅原项目与搜索原项目 issue：
  - 原项目：<https://github.com/TheNetAdmin/zjuthesis>（官方文档：<https://thenetadmin.github.io/zjuthesis>）

### 2.3 填写论文信息

个人信息在 `zjuthesis.tex` 中填写。

### 2.4 论文内容

| 内容 | 位置 |
| --- | --- |
| 正文章节 | 在 `body/graduate/chapter/` 下创建章节文件（如 `chapter1.tex`），并在 `body/graduate/content.tex` 中登记装配 |
| 前置页（封面/声明/致谢/摘要/缩略词表） | `page/graduate/` |
| 后置页（参考文献/附录/学术成果/作者简历） | `body/graduate/post/` 与 `body/graduate/post.tex` |
| 参考文献条目 | `body/ref.bib` |
| 图片 | `figure/`（正文用 `\includegraphics{...}`，示例见 `figure/example/`） |
| 开题封面 / 开题目录 | `page/graduate/proposal/` |
| 开题参考文献 | `body/graduate/proposal/ref.tex`（可按学位/专业覆盖） |

### 2.5 示例与规范

- 示例正文见 `body/graduate/chapter/chapter1.tex`，包含文献引用、图片、表格、公式、物理单位与修订标记等常见写法示例；需要多章时复制为 `chapterN.tex` 并在 `body/graduate/content.tex` 中登记。

### 2.6 相关规范和提示

- 修订功能：可以对修改后的内容进行黄色高亮标记，方便答辩时答辩老师查看：
  通过 `\rev{中文/混排文字}` 或 `\revEN{English sentence}` 标记；
  总开关在 `zjuthesis.tex`：`\showrevtrue` 显示标记，`\showrevfalse` 隐藏并输出原文（正式提交版）
- 物理单位：请避免手动写物理单位，比如 `23 ms`，使用 `siunitx` 宏包进行物理单位书写，详见示例文件。
- 矢量加粗：公式中的矢量、矩阵加粗请用 `\bm{}`（如 `\bm x`、`\bm A`），**不要用 `\boldsymbol{}`**；
  模板已将 `\bm` 重定义为 `\symbfit`（基于 `unicode-math`），与正文数学字体保持一致
- 文献库管理（推荐）：使用 **Zotero** 管理文献库（官网：<https://www.zotero.org/>），并安装插件
  **Better BibTeX for Zotero**（插件可从中文本地化/插件社区获取：<https://zotero-chinese.com/plugins/>），
  通过其“自动导出（Auto-export）”将 `body/ref.bib` 指向 Zotero 收藏集，实现文献条目的自动生成与更新，
  **避免手动逐条维护/修改 bib 文件**；导出的引用 key 建议采用 `auth.lower + year + title` 一类稳定命名，正文引用照常使用 `\cite{}`

### 2.7 其他工具

- 字数统计：`scripts/utils/word_count.sh`（依赖 texcount，先编译一遍再运行）
- 公式转图片：`scripts/mk-formula-figure.sh` + `scripts/formula-figure.tex`
- AI 写作与 LaTeX 规范文档：`docs/writing_rules.md`（行文风格）、`docs/latex_rules.md`（公式/表格/引用写法）
- AI 辅助写作/开发：仓库根目录的 `CLAUDE.md` 提供项目上下文（编译方式、正文目录、LaTeX 语法与行文规则、章节序号对应关系等），
  供支持该约定的 AI 工具（如 Claude Code 等）自动读取；需要 AI 协助撰写/修改论文时，把本仓库交给这类工具，
  AI 会先读取 `CLAUDE.md` 再按项目规范动手
