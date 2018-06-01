# HashiCorp Serf on Alpine

A super-simple Serf image that is suitable for use as a no-frills client or as the base for a server image.

No `VOLUME`s nor `EXPOSE`s -- *no side-effects*. Just an `ENTRYPOINT` to the `serf` executable.

```
$ docker run --rm -it dweomer/serf
usage: serf [--version] [--help] <command> [<args>]

Available commands are:
    agent           Runs a Serf agent
    event           Send a custom event through the Serf cluster
    force-leave     Forces a member of the cluster to enter the "left" state
    info            Provides debugging information for operators
    join            Tell Serf agent to join cluster
    keygen          Generates a new encryption key
    keys            Manipulate the internal encryption keyring used by Serf
    leave           Gracefully leaves the Serf cluster and shuts down
    members         Lists the members of a Serf cluster
    monitor         Stream logs from a Serf agent
    query           Send a query to the Serf cluster
    reachability    Test network reachability
    rtt             Estimates network round trip time between nodes
    tags            Modify tags of a running Serf agent
    version         Prints the Serf version
```
