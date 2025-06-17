#!/bin/bash

# Check if nbstripout is installed
if ! command -v nbstripout &>/dev/null; then
  echo "Error: nbstripout is not installed"
  echo "Please install it along with other dev dependencies via"
  echo "pip install .[dev]"
  exit 1
fi

# NOTE: the metadata.kernelspec is kept since quarto needs it to start
# the kernel and execute the cells when rendering
nbstripout --extra-keys="metadata.celltoolbar " \
  "metadata.language_info.codemirror_mode.version" \
  "metadata.language_info.pygments_lexer" \
  "metadata.language_info.version metadata.toc" \
  "metadata.notify_time metadata.varInspector" \
  "cell.metadata.heading_collapsed" \
  "cell.metadata.hidden" \
  "cell.metadata.code_folding" \
  "cell.metadata.tags" \
  "cell.metadata.init_cell" \
  session1/notebook.ipynb session2/notebook.ipynb
