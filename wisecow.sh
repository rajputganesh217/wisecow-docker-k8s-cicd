#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
    read line
    echo $line
}

handleRequest() {
    mod=$(fortune)
    cat <<EOF > $RSPFILE
HTTP/1.1 200 OK

<pre>`cowsay "$mod"`</pre>
EOF
}

prerequisites() {
    command -v cowsay >/dev/null 2>&1 &&
    command -v fortune >/dev/null 2>&1 || {
        echo "Install prerequisites."
        exit 1
    }
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."
    while true; do
        # Listen for one connection at a time
        cat $RSPFILE | nc -l -p $SRVPORT -q 1 | handleRequest
        sleep 0.01
    done
}

main
