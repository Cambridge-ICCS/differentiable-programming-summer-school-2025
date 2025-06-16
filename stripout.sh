#/bin/bash

# Check if .venv is active
if [[ "$VIRTUAL_ENV" != *".venv"* ]] || [[ -z "$VIRTUAL_ENV" ]]; then
    echo "Error: .venv virtual environment is not active"
    echo "Please activate it with: source .venv/bin/activate"
    exit 1
fi

# Check if nbstripout is installed
if ! command -v nbstripout &> /dev/null; then
    echo "Error: nbstripout is not installed"
    echo "Please install it along with other dev dependencies via"
    echo "pip3 install -r requirements-dev.txt"
    exit 1
fi

# NOTE: the metadata.kernelspec is kept since quarto needs it to start 
# the kernel and execute the cells when rendering
nbstripout --extra-keys="metadata.celltoolbar metadata.language_info.codemirror_mode.version metadata.language_info.pygments_lexer metadata.language_info.version metadata.toc metadata.notify_time metadata.varInspector cell.metadata.heading_collapsed cell.metadata.hidden cell.metadata.code_folding cell.metadata.tags cell.metadata.init_cell" session1/**.ipynb session2/**.ipynb
