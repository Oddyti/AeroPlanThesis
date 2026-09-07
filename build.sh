#!/bin/bash
set -e
cd "$(dirname "$0")"
latexmk -C -outdir=out
latexmk -xelatex -outdir=out zjuthesis
echo "PDF: out/zjuthesis.pdf"
