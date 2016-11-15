#!/bin/sh

# a bit of a hack, assume hosts /proc has been bind mounted to
# /hostproc.  Then check that the vm.max_map_count is at least
# 262144.  If it is less then, set to 262144.  If it is greater
# then or equal, leave alone.

# this is required by elasticsearch


mmcount_path="/hostproc/sys/vm/max_map_count"
read -r var < $mmcount_path

if [[ $var -lt 262144 ]]; then
  echo "max_map_count is ${var}.  Going to set to 262144"
  echo '262144' > $mmcount_path
fi