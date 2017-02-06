import pathlib
import os

class Updater:
    def __init__(self, path):
        self.path = pathlib.Path(path).expanduser().resolve()
        self.stored_path = pathlib.Path(self.path.stem).resolve()

    def get_mod_time(self, path):
        most_recent = 0
        if path.is_dir():
            for (dirpath, dirnames, filenames) in os.walk(str(path)):
                for f in filenames:
                    mtime = pathlib.Path(dirpath).joinpath(f).stat().st_mtime
                    if mtime > most_recent:
                        most_recent = mtime
        elif path.is_file():
            most_recent = pathlib.Path(dirpath).joinpath(f).stat().st_mtime
        return most_recent

    def update(self):
        pass

def main():
    u = Updater("~/.zshrc")
    print(u.get_mod_time(u.path))

if __name__ == '__main__':
    main()
