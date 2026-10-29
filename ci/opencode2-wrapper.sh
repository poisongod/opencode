#!/data/data/com.termux/files/usr/bin/sh
set -eu

self=$0
case "$self" in
  /*) ;;
  *) self=$PWD/$self ;;
esac
dir=$(CDPATH= cd -- "$(dirname -- "$self")" && pwd)

if [ -x "$dir/opencode2.bin" ]; then
  root=$dir
else
  root=$(CDPATH= cd -- "$dir/../libexec/opencode2" && pwd)
fi

export OTUI_ASSET_ROOT="$root/otui"
export LD_LIBRARY_PATH="$root/otui/@opentui/core-linux-arm64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export OPENCODE_EXPERIMENTAL_DISABLE_FILEWATCHER="${OPENCODE_EXPERIMENTAL_DISABLE_FILEWATCHER:-true}"

exec "$root/opencode2.bin" "$@"
