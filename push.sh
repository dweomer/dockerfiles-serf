#!/bin/sh
set -e
for rel in $(for ver in $(find versions/0.[0-9] | sort); do echo $ver; eval "find versions -name '$(basename $ver).[0-9]' | sort"; done; echo latest); do
    docker push dweomer/serf:$(basename $rel)
done
