#!/usr/bin/env zsh
set -e

# 项目根目录（无论从哪里调用都能正确定位）
PROJECT_ROOT=${0:a:h}/..

TEX=${PROJECT_ROOT}/scripts/formula-figure.tex
BASENAME=formula-figure
BUILDDIR=${PROJECT_ROOT}/out
OUTPUT=${PROJECT_ROOT}/figure/${BASENAME}.svg

# 生成 xdv，中间文件写入 out/
xelatex -no-pdf -interaction=nonstopmode \
  -output-directory=${BUILDDIR} "$TEX"

# 生成 SVG 到 figure/
dvisvgm --no-fonts -n \
  -o "${OUTPUT}" \
  "${BUILDDIR}/${BASENAME}.xdv"

# 清理中间文件
rm -f \
  "${BUILDDIR}/${BASENAME}.aux" \
  "${BUILDDIR}/${BASENAME}.log" \
  "${BUILDDIR}/${BASENAME}.out" \
  "${BUILDDIR}/${BASENAME}.nav" \
  "${BUILDDIR}/${BASENAME}.snm" \
  "${BUILDDIR}/${BASENAME}.toc" \
  "${BUILDDIR}/${BASENAME}.bcf" \
  "${BUILDDIR}/${BASENAME}.run.xml" \
  "${BUILDDIR}/${BASENAME}.xdv"

echo "生成完成: ${OUTPUT}"
