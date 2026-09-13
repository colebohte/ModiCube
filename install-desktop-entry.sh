DESKTOP_FILE=ModiCube.desktop
GAME_DIR=`pwd`

# remove existing ClassiCube desktop entry file
rm $DESKTOP_FILE

# download ClassiCube icon from github if necessary
if [ -f "CCicon.png" ]
then
  echo "CCicon.png exists already. Skipping download."
else
  echo "CCicon.png doesn't exist. Attempting to download it.."
  wget "https://raw.githubusercontent.com/ClassiCube/classicube/master/misc/CCicon.png"
fi

# create ModiCube desktop entry
echo 'Creating ModiCube.desktop..'
cat >> $DESKTOP_FILE << EOF
[Desktop Entry]
Type=Application
Comment=Minecraft Classic inspired sandbox game
Name=ModiCube
Exec=$GAME_DIR/ClassiCube
Icon=$GAME_DIR/CCicon.png
Path=$GAME_DIR
Terminal=false
Categories=Game;
Actions=singleplayer;resume;

[Desktop Action singleplayer]
Name=Start singleplayer
Exec=$GAME_DIR/ModiCube --singleplayer

[Desktop Action resume]
Name=Resume last server
Exec=$GAME_DIR/ModiCube --resume
EOF
chmod +x $DESKTOP_FILE

echo 'Installing ModiCube.desktop..'
# install ModiCube desktop entry into the system
sudo desktop-file-install --dir=/usr/share/applications ModiCube.desktop
sudo update-desktop-database /usr/share/applications
