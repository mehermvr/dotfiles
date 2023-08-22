#!/bin/bash
fork() {
    (nohup "$@" >/dev/null 2>&1 &)
}
