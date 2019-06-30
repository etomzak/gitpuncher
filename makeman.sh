#!/bin/bash
pod2man --section=1 --center="Gitpuncher Manual" bin/git-confess | gzip > man/man1/git-confess.1.gz

