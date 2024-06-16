#Set up Ubuntu for exporting GameMaker Studio project to that
#Instructions come from https://help.gamemaker.io/hc/en-us/articles/235186168-Setting-Up-For-Ubuntu

#Install libraries for compiling
sudo apt install build-essential openssh-server clang libssl-dev libxrandr-dev libxxf86vm-dev libopenal-dev libgl1-mesa-dev libglu1-mesa-dev zlib1g-dev libcurl4-openssl-dev ffmpeg libfuse2 curl

#Steam
sudo mkdir /opt/steam-runtime/
curl https://repo.steampowered.com/steamrt-images-scout/snapshots/latest-steam-client-general-availability/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.tar.gz | sudo tar -xzf - -C /opt/steam-runtime/

#Linuxdeploy
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
sudo install -m 0755 linuxdeploy-x86_64.AppImage /usr/local/bin/linuxdeploy

#Appimage tool
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
sudo install -m 0755 appimagetool-x86_64.AppImage /usr/local/bin/appimagetool

#Get IP address
hostname -I
