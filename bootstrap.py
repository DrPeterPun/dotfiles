import subprocess


package_list = [
        'git',
        'code',
        'python3',
        'jre-openjdk',
        'discord',
        'neovim',
        'libreoffice-fresh',
        'okular'
        ]


for package in package_list:
    subprocess.run(["yay", "-S", package])
