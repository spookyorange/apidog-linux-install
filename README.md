# Install tarball version of Apidog with just a basic script!

A script to easily install Apidog the tarball way on your Linux machine!

Note: This installation script is by no means affiliated with Apidog project, or its maintainers.

## Usage

Clone the repo and run the script
```bash

git clone https://github.com/spookyorange/apidog-linux-install.git
cd apidog-linux-install
sh ./install.sh

```

To remove the application(if it has been installed with this method)
```bash

sh ./uninstall.sh

```

Updates are handled by running the install script again, you can just run the install script and all good!
```bash

sh ./install.sh

```

## Details

The script will install the application in the following destinations if you have installed locally:

- ~/.tarball-installations/apidog
- ~/.local/bin/apidog
- ~/.local/share/applications/apidog.desktop

## Tested Distros

- Fedora by Spookyorange
- Fedora Atomic(Silverblue) by Spookyorange

## Contributing

If you have a distro that you would like to add to the list of tested distros, please submit a pull request with the changes you made to the script and the distro you tested it on.

