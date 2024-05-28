#!/bin/bash
set -euo pipefail

source /opt/conda/bin/activate StrVCTVRE_py_3

if [ ! -f /opt/StrVCTVRE/data/hg38.phyloP100way.bw ]; then
    echo "Error: /opt/StrVCTVRE/data/hg38.phyloP100way.bw not found"
    exit 1
fi

INPUT_FILE=$(mktemp)
cat - > "$INPUT_FILE"

OUTPUT_FILE="output.txt"

python StrVCTVRE.py -i "$INPUT_FILE" -o "$OUTPUT_FILE" 1>&2

rm "$INPUT_FILE"

cat "$OUTPUT_FILE"
