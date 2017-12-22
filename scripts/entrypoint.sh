#!/bin/bash
set -e

[[ "$1" == "couchbase-server" ]] && {

    if [ $(whoami) = "couchbase" ]; then
        # Ensure that /opt/couchbase/var is owned by user 'couchbase' and
        # is writable
        if [ ! -w /opt/couchbase/var -o \
            $(find /opt/couchbase/var -maxdepth 0 -printf '%u') != "couchbase" ]; then
            echo "/opt/couchbase/var is not owned and writable by UID 1000"
            echo "Aborting as Couchbase Server will likely not run"
            exit 1
        fi
    fi
    echo "Starting Couchbase Server -- Web UI available at http://<ip>:8091 and logs available in /opt/couchbase/var/lib/couchbase/logs"
    exec /usr/sbin/runsvdir-start
}

exec "$@"
