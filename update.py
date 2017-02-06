import pathlib
import os
from shutil import copytree, copy2, rmtree

class Updater:
    def __init__(self, path):
        self.path = pathlib.Path(path).expanduser()
        if self.path.exists():
            self.path = self.path.resolve()
        self.stored_path = pathlib.Path(self.path.stem)
        if self.stored_path.exists():
            self.stored_path = self.stored_path.resolve()

    def get_mod_time(self, path):
        most_recent = 0
        if path.is_dir():
            for (dirpath, dirnames, filenames) in os.walk(str(path)):
                for f in filenames:
                    mtime = pathlib.Path(dirpath).joinpath(f).stat().st_mtime
                    if mtime > most_recent:
                        most_recent = mtime
        elif path.is_file():
            most_recent = path.stat().st_mtime
        return most_recent

    def update(self):
        print("Checking {0}".format(self.path.stem))
        if self.get_mod_time(self.path) > self.get_mod_time(self.stored_path):
            print("  Copying {0} -> {1}... ".format(self.path, self.stored_path), end = "")
            self.copy(self.path, self.stored_path)
            print("Finished.")
        elif self.get_mod_time(self.path) < self.get_mod_time(self.stored_path):
            print("  Copying {1} -> {0}... ".format(self.path, self.stored_path), end = "")
            self.copy(self.stored_path, self.path)
            print("Finished.")
        else:
            print("  Nothing Updated")

    def copy(self, src, dst):
        if src.is_dir():
            if dst.exists():
                rmtree(str(dst))
            copytree(str(src), str(dst), False, None)
        elif src.is_file():
            copy2(str(src), str(dst))

def main():
    important_files = [
    "~/.zshrc",
    "~/.bash_aliases",
    "~/.bashrc",
    "~/.vimrc",
    "~/.vim",
    "~/.atom"
    ]
    for f in important_files:
        u = Updater(f)
        u.update()

if __name__ == '__main__':
    main()
