#!/bin/bash

app_name="apidog"
display_name="Apidog"
literal_name_of_installation_directory=".tarball-installations"
universal_path_for_installation_directory="$HOME/$literal_name_of_installation_directory"
app_installation_directory="$universal_path_for_installation_directory/$app_name"
official_package_location="https://file-assets.apidog.com/download/Apidog-linux-manual-latest.tar.gz"
tar_location="./hello.tar.gz"
local_bin_path="$HOME/.local/bin"
local_application_path="$HOME/.local/share/applications"
app_bin_in_local_bin="$local_bin_path/$app_name"
desktop_in_local_applications="$local_application_path/$app_name.desktop"
icon_path=$app_installation_directory/resources/app.asar.unpacked/dist/assets/logo.png
executable_path=$app_installation_directory/apidog

desktop_keywords=api,json,http,request,web
desktop_terminal=false
desktop_type=Application
desktop_categories="Api;JSON;HTTP;Request;Web;Rest;API Client;"
desktop_startup_wm_class="Apidog"

if [ "$XDG_SESSION_TYPE" = "wayland" ] || [ "$WAYLAND_DISPLAY" != "" ]; then
  desktop_exec="$executable_path --enable-features=UseOzonePlatform --ozone-platform=wayland %u"
else
  desktop_exec="$executable_path %u"
fi

echo "Welcome to $display_name tarball installer, just chill and wait for the installation to complete!"

sleep 1

echo "Checking if old files exist"
if [ -f $app_bin_in_local_bin ]; then
  echo "Old bin file detected, removing..."
  rm $app_bin_in_local_bin
fi

if [ -d $app_installation_directory ]; then
  echo "Old app files are found, removing..."
  rm -rf $app_installation_directory
fi

if [ -f $desktop_in_local_applications ]; then
  echo "Old bin file detected, removing..."
  rm $desktop_in_local_applications
fi

sleep 1

echo "Installing the latest package"
curl -L -o $tar_location $official_package_location

mkdir $app_name

tar -xvf $tar_location -C $app_name --strip-components=1

echo "Installed and untarred successfully"

if [ ! -d $universal_path_for_installation_directory ]; then
  echo "Creating the $universal_path_for_installation_directory directory for installation"
  mkdir $universal_path_for_installation_directory
fi

mv $app_name $app_installation_directory

echo "$app_name successfully moved to your safe place!"

rm $tar_location

if [ ! -d $local_bin_path ]; then
  echo "$local_bin_path not found, creating it for you"
  mkdir $local_bin_path
fi

touch $app_bin_in_local_bin
chmod u+x $app_bin_in_local_bin
echo "#!/bin/bash
$executable_path" >> $app_bin_in_local_bin

echo "Created executable for your \$PATH if you ever need"

if [ ! -d $local_application_path ]; then
  echo "Creating the $local_application_path directory for desktop file"
  mkdir $local_application_path
fi

touch $desktop_in_local_applications
echo "
[Desktop Entry]
Name=$display_name
Keywords=$desktop_keywords
Exec=$desktop_exec
Icon=$icon_path
Terminal=$desktop_terminal
Type=$desktop_type
StartupWMClass=$desktop_startup_wm_class
Categories=$desktop_categories
" >> $desktop_in_local_applications

echo "Created desktop entry successfully"

sleep 1

echo "Installation is successful"

sleep 1

echo "Done, and done, have fun!"

sleep 1

exit 0

