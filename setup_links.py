#!/usr/bin/env python3
# Set up links to configuration files
# Creates symlinks to all configuration files located inside this repository
# Default link location is ~/<link path>

import os
import shutil
from fnmatch import fnmatch
from pathlib import Path

DEFAULT_DST= Path.home()
IGNORE = [__file__, '.*.swp', '.git', '.gitignore', '.gitmodules']

def make_symlink(src, dst):
    done = False
    print('Making link {} -> {}'.format(dst, src))
    while not done:
        try:
            os.symlink(str(src), str(dst))
            done = True
        except FileExistsError:
            ovw = input('  File exists. Overwrite? (y/n)').lower().strip() \
                    == 'y'
            if ovw:
                if dst.is_dir():
                    shutil.rmtree(str(dst))
                else:
                    os.remove(str(dst))
            else:
                done = True
        except Exception as e:
            print('  Link creation failed')
            print(e)

def main():
    fnames = [fname for fname in os.listdir() if not any([fnmatch(fname, p)
            for p in IGNORE])]
    for fname in fnames:
        #  src = Path(fname).resolve(strict = True)
        src = Path(fname).resolve()
        dst = DEFAULT_DST.joinpath(fname)
        make_symlink(src, dst)

if __name__ == '__main__':
    main()
