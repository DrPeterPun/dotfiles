import subprocess
import os


package_list = [
        'git',
        'code',
        'python3',
        'pip',
        'jre-openjdk',
        'discord',
        'neovim',
        'libreoffice-fresh',
        'okular',
        'gcc',
        'firefox',
        'nano-fonts',
        'firefox',
        'base-devel'
        ]


# install yay if it isnt already
subprocess.run(["pacman", "-S", "yay"])

# update the syste packages
subprocess.run(["yay", "-Syyu"])

for package in package_list:
    subprocess.run(["yay", "-S", package])

# make links of all necessary config files
conf_list = [
        '.zshrc',
        '.config/i3/config',
        '.config/nvim/init.lua',
        '.config/'
        ]


def get_directory_path(file_path):
    directory_path = os.path.dirname(file_path)
    return directory_path


def create_relative_path(path):
    home = os.path.expanduser("~")  # Get the user's home directory
    dir_path = os.path.join(home, get_directory_path(path))
    # Combine home directory with relative path

    if not os.path.exists(dir_path):
        os.makedirs(dir_path)  # Recursively create directories if they don't exist

        print(f"Created directories: {dir_path}")
    else:
        print(f"Path already exists: {dir_path}")


relative_file_path = "relative/file/path"
for p in conf_list:
    create_relative_path(p)
