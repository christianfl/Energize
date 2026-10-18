#!/bin/sh

# Workaround for devices such as the Librem 5.
if [ "$(uname -m)" = "aarch64" ]; then
  export GDK_GL=gles
fi

exec "/app/energize/energize" "$@"
