# Gitpuncher

_Its punches are as strong as its gits_

## Overview

Ever notice how in git, the information you need most frequently is the hardest
to get, while the information you don't care about is always staring you in the
face? If I do `git pull`, I might see several screens of changed files race
past, all with colored +/- characters. This is exciting in a
Kitt-doing-300MpH-on-the-highway sort of way, but knowing that a colleauge
changed `---++++++` in a file I've never looked at isn't exactly useful
information. Meanwhile, how often has this happened:

```console
$: git status foo.bar
$: # Huh? What does no output mean again? No changes?
$: # What if *.bar files are listed in this repo's .gitignore?
```

Gitpuncher contains one utility -- `git-confess` -- to solve this particular
problem. `git-confess` interrogates a file for various useful information:

```console
$: git confess foo.bar
Tracked file (no changes)
$:
$: git confess foo.o
Ignored file (see .gitignore)
$:
$: git confess foo.c
New file with staged and unstaged changes
  Staged changes:   0 lines
  Unstaged changes: Modified lines: 100% (17 lines total, all new)
$:
$: git confess -v baz.c
Tracked file with staged and unstaged changes
  Created:          2017-07-17 (1 year, 11 months ago)
  Last modified:    2018-01-12 (1 year, 6 months ago)
  Top contributor:  etomzak
  Staged changes:   Size change: 2% Modified lines: 4% (622 lines total)
  Unstaged changes: Size change: 1% Modified lines: 12% (629 lines total)
```

## Usage

```console
$: git confess -h
usage: git confess [-vv -q] <path>
```

`git-confess` takes two options: `-v` (`--verbose`) and `-q` (`--quiet`) to
increase or decrease verbosity. Both can be given more than once, and they
counteract each other. Default behavior is one level of verbosity (so `-q`
reduces output, but `-qq` does not reduce output further).

## Getting Gitpuncher

### Quick-start

```console
$: git clone https://github.com/etomzak/gitpuncher.git
$: cd gitpuncher/bin
$: export PATH="$PATH:$PWD"
```

### Installing

1. Place `gitpuncher/bin/git-confess` into a directory on your `$PATH`
2. Place `gitpuncher/man/man1/git-confess.1.gz` into a `man1` directory on your
   manpath

Note that #2 isn't strictly necessary, but if you don't do it, then `git
confess --help` and `man git-confess` won't work (`git-confess --help` will
still work).
