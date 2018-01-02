#!/usr/bin/env python3
# Set up links to configuration files
# Creates symlinks to all configuration files located inside this repository
# Default link location is ~/<link path>

import os
from fnmatch import fnmatch
from pathlib import Path

DEFAULT_SRC = Path.home()
IGNORE = [__file__, '.*.swp']

def make_symlink(src, dst):
    try:
        print('Making link {} -> {}'.format(src, dst))
        os.symlink(str(src), str(dst))
    except:
        print('  Link creation failed')

def main():
    fnames = [fname for fname in os.listdir() if not any([fnmatch(fname, p)
        for p in IGNORE])]
    for fname in fnames:
        dst = Path(fname).resolve(strict = True)
        src = DEFAULT_SRC.joinpath(fname)
        make_symlink(src, dst)

if __name__ == '__main__':
    main()
