# AeroPlanThesis（浙江大学硕/博学位论文 LaTeX 模板）

背景：浙江大学硕/博毕业论文 LaTeX 项目（课题组专用），项目说明与使用方式见 @README.md

## 编译

直接运行 `./build.sh`，出现问题需要调试时手动编译

## 内容文件目录

模板配置入口：`@zjuthesis.tex`
章节源码位于： `@body/graduate/chapter/`（当前示例为单章 `chapter1.tex`，可复制扩展为多章，并在 `@body/graduate/content.tex` 中登记）
摘要：`@page/graduate/abstract.tex`
附录：`@body/graduate/post/appendix.tex`
学术成果：`@body/graduate/post/achievements.tex`
缩略词表：`@page/graduate/term-translation.tex`

## 重要规则

### Latex 语法规则

设计到任何 Latex 语法，公式、变量等时看，见 @docs/latex_rules.md

### 行文风格规则

- 避免工程思维撰写，不要把论文写成项目代码说明书，以高水平科研论文的撰写方式撰写论文，论文是实验的升华包装。

其余相关涉及到撰写风格时看，见 @docs/writing_rules.md

### 章节序号对应关系

举例 2.1.3 节对应：第 2 章正文文件（如 `@body/graduate/chapter/chapterN.tex`）内第 1 个 `\section{}` 下第 3 个小节 `\subsection{}`

## Final Response Efficiency

Keep final responses concise.

After completing a task:
- Do not restate the task.
- Do not explain obvious implementation details.
- Do not repeat information visible in the diff.
- Report only:
  - Changes made
  - Verification performed
  - Important problems or decisions
- Prefer 1–3 bullets.
- If there are no important issues, do not add recommendations or unnecessary commentary.
- Expand the explanation only when the user explicitly asks for it or when the result is ambiguous, risky, or requires a decision.

