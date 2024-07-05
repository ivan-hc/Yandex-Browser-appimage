#!/bin/sh

############################# STABLE
APP=yandex-browser
mkdir tmp
cd ./tmp
wget -q "$(wget -q https://api.github.com/repos/probonopd/go-appimage/releases -O - | sed 's/"/ /g; s/ /\n/g' | grep -o 'https.*continuous.*tool.*86_64.*mage$')" -O appimagetool
chmod a+x ./appimagetool

wget -q $(echo "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-browser-stable/$(curl -Ls https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-browser-stable/ | tr '"' '\n' | grep -i "^yandex.*deb$" | head -1)")
ar x ./*.deb
tar xf ./data.tar.xz
mkdir -p "$APP".AppDir
if ! test -f ./"$APP".AppDir/*.desktop; then
	mv ./opt/*/*/* ./"$APP".AppDir/ 2> /dev/null
	mv ./usr/share/applications/*.desktop ./"$APP".AppDir/ 2> /dev/null
	ICONNAME=$(cat ./"$APP".AppDir/*desktop | grep "Icon=" | head -1 | cut -c 6-)
	cp -r ./"$APP".AppDir/*512.png ./"$APP".AppDir/"$ICONNAME".png
fi

tar xf ./control.tar.xz
VERSION=$(cat control | grep Version | cut -c 10-)

rm -R -f ./"$APP".AppDir/AppRun
cat >> ./"$APP".AppDir/AppRun << 'EOF'
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
export UNION_PRELOAD="${HERE}"
export LD_LIBRARY_PATH=/lib/:/lib64/:/lib/x86_64-linux-gnu/:/usr/lib/:"${HERE}"/:"${HERE}"/lib/:LD_LIBRARY_PATH
exec "${HERE}"/yandex_browser "$@"
EOF
chmod a+x ./"$APP".AppDir/AppRun
ARCH=x86_64 VERSION=$(./appimagetool -v | grep -o '[[:digit:]]*') ./appimagetool -s ./"$APP".AppDir
cd ..
mv ./tmp/*AppImage ./Yandex_Browser-"$VERSION"-x86_64.AppImage

############################# BETA
APP=yandex-browser-beta
mkdir tmp2
cd ./tmp2
wget -q "$(wget -q https://api.github.com/repos/probonopd/go-appimage/releases -O - | sed 's/"/ /g; s/ /\n/g' | grep -o 'https.*continuous.*tool.*86_64.*mage$')" -O appimagetool
chmod a+x ./appimagetool

wget -q $(echo "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/$APP/$(curl -Ls https://repo.yandex.ru/yandex-browser/deb/pool/main/y/"$APP"/ | tr '"' '\n' | grep -i "^yandex.*deb$" | head -1)")
ar x ./*.deb
tar xf ./data.tar.xz
mkdir -p "$APP".AppDir
if ! test -f ./"$APP".AppDir/*.desktop; then
	mv ./opt/*/*/* ./"$APP".AppDir/ 2> /dev/null
	mv ./usr/share/applications/*.desktop ./"$APP".AppDir/ 2> /dev/null
	ICONNAME=$(cat ./"$APP".AppDir/*desktop | grep "Icon=" | head -1 | cut -c 6-)
	cp -r ./"$APP".AppDir/*512.png ./"$APP".AppDir/"$ICONNAME".png
fi

tar xf ./control.tar.xz
VERSION=$(cat control | grep Version | cut -c 10-)

rm -R -f ./"$APP".AppDir/AppRun
cat >> ./"$APP".AppDir/AppRun << 'EOF'
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
export UNION_PRELOAD="${HERE}"
export LD_LIBRARY_PATH=/lib/:/lib64/:/lib/x86_64-linux-gnu/:/usr/lib/:"${HERE}"/:"${HERE}"/lib/:LD_LIBRARY_PATH
exec "${HERE}"/yandex_browser "$@"
EOF
chmod a+x ./"$APP".AppDir/AppRun
ARCH=x86_64 VERSION=$(./appimagetool -v | grep -o '[[:digit:]]*') ./appimagetool -s ./"$APP".AppDir
cd ..
mv ./tmp2/*AppImage ./Yandex_Browser-BETA-"$VERSION"-x86_64.AppImage

############################# CORPORATE
APP=yandex-browser-corporate
mkdir tmp3
cd ./tmp3
wget -q "$(wget -q https://api.github.com/repos/probonopd/go-appimage/releases -O - | sed 's/"/ /g; s/ /\n/g' | grep -o 'https.*continuous.*tool.*86_64.*mage$')" -O appimagetool
chmod a+x ./appimagetool

wget -q $(echo "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/$APP/$(curl -Ls https://repo.yandex.ru/yandex-browser/deb/pool/main/y/"$APP"/ | tr '"' '\n' | grep -i "^yandex.*deb$" | head -1)")
ar x ./*.deb
tar xf ./data.tar.xz
mkdir -p "$APP".AppDir
if ! test -f ./"$APP".AppDir/*.desktop; then
	mv ./opt/*/*/* ./"$APP".AppDir/ 2> /dev/null
	mv ./usr/share/applications/*.desktop ./"$APP".AppDir/ 2> /dev/null
	ICONNAME=$(cat ./"$APP".AppDir/*desktop | grep "Icon=" | head -1 | cut -c 6-)
	cp -r ./"$APP".AppDir/*512.png ./"$APP".AppDir/"$ICONNAME".png
fi

tar xf ./control.tar.xz
VERSION=$(cat control | grep Version | cut -c 10-)

rm -R -f ./"$APP".AppDir/AppRun
cat >> ./"$APP".AppDir/AppRun << 'EOF'
#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
export UNION_PRELOAD="${HERE}"
export LD_LIBRARY_PATH=/lib/:/lib64/:/lib/x86_64-linux-gnu/:/usr/lib/:"${HERE}"/:"${HERE}"/lib/:LD_LIBRARY_PATH
exec "${HERE}"/yandex_browser "$@"
EOF
chmod a+x ./"$APP".AppDir/AppRun
ARCH=x86_64 VERSION=$(./appimagetool -v | grep -o '[[:digit:]]*') ./appimagetool -s ./"$APP".AppDir
cd ..
mv ./tmp3/*AppImage ./Yandex_Browser-CORPORATE-"$VERSION"-x86_64.AppImage
