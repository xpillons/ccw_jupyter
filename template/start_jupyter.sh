#!/usr/bin/env bash
echo "Starting main script..."
echo "TTT - $(date)"

# install dependencies
pip install ipyfilechooser voila jupyter_app_launcher
jupyter labextension list

JUPYTERAPPLAUNCHERDIR="${NOTEBOOK_ROOT}/.local/share/jupyter/jupyter_app_launcher"
mkdir -p $JUPYTERAPPLAUNCHERDIR
JUPYTERAPPLAUNCHERCONF=$JUPYTERAPPLAUNCHERDIR/config.yaml

mkdir $HOME/jupyter_nb_apps

#
# Start Jupyter server
#

# Set working directory to notebook root directory
cd "${NOTEBOOK_ROOT}"
echo "TTT - $(date)"

# List available kernels for debugging purposes
set -x
jupyter kernelspec list
{ set +x; } 2>/dev/null
echo "TTT - $(date)"

# Launch the Jupyter server
set -x
jupyter lab --config="${CONFIG_FILE}"
