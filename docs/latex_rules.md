### 数学变量命名
- 数学变量使用斜体；表示名称、缩写或语义标签的下标、上标使用正体，即 `\mathrm{}`。
- 示例：
    - `\bm{u}_{\mathrm{flex}}`
    - `\bm{q}_{\mathrm{cmd}}`
    - `\bm{q}_{\mathrm{err}}`
    - `\bm{\omega}_{\mathrm{ref}}`
    - `J_{\mathrm{vib}}`
- 禁止直接写成 `\bm{u}_{flex}`、`\bm{q}_{cmd}`、`J_{vib}`。

### 交叉引用
- 对于图、表、公式、章节的引用，禁止硬编码引用。图、表、公式、章节需要先手动设置`label{}`，然后引用，其中公式用`~\eqref`，其余用`~\ref`

### 表格
- 所有表格环境（包括 table, longtable），手动设置字号为`\small`
- 表格使用 booktabs 模式，即用`\toprule, \midrule, \bottomrule`而非`\hline`

### 数学模式
- 行内公式统一使用`\(\)`包裹，而不是过时的`$$`
- 行间公式统一用`{equation}`环境包裹

### 正文中数字与单位
- 正文中的纯数字、百分号、单位和科学计数法均使用**正文模式**；仅数学变量、公式和推导使用数学模式。
- 单位统一使用 `siunitx` 宏包，示例：
    - `15~\si{\second}`、`0.2~\si{\radian\per\second}`、`5~\si{\newton\meter}`
- 科学计数法采用文本形式，示例：
    - `7.7 \texttimes\ 10\textsuperscript{-3}`