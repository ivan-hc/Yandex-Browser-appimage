#!/bin/sh

APP=yandex-browser

# TEMPORARY DIRECTORY
mkdir -p tmp
cd ./tmp || exit 1

# DOWNLOAD APPIMAGETOOL
if ! test -f ./appimagetool; then
	wget -q "$(wget -q https://api.github.com/repos/probonopd/go-appimage/releases -O - | sed 's/"/ /g; s/ /\n/g' | grep -o 'https.*continuous.*tool.*86_64.*mage$')" -O appimagetool
	chmod a+x ./appimagetool
fi

# CREATE CHROME BROWSER APPIMAGES

_create_yandex_appimage(){
	if wget --version | head -1 | grep -q ' 1.'; then
		wget -q --no-verbose --show-progress --progress=bar "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/$APP-$CHANNEL/$(curl -Ls https://repo.yandex.ru/yandex-browser/deb/pool/main/y/"$APP"-"$CHANNEL"/ | tr '"' '\n' | grep -i "^yandex.*deb$" | head -1)"
	else
		wget "https://repo.yandex.ru/yandex-browser/deb/pool/main/y/$APP-$CHANNEL/$(curl -Ls https://repo.yandex.ru/yandex-browser/deb/pool/main/y/"$APP"-"$CHANNEL"/ | tr '"' '\n' | grep -i "^yandex.*deb$" | head -1)"
	fi
	ar x ./*.deb
	tar xf ./data.tar.xz
	mkdir "$APP".AppDir
	mv ./opt/*/*/* ./"$APP".AppDir/
	mv ./usr/share/applications/*.desktop ./"$APP".AppDir/
	ICONNAME=$(cat ./"$APP".AppDir/*desktop | grep "Icon=" | head -1 | cut -c 6-)
	cp ./"$APP".AppDir/*512.png ./"$APP".AppDir/"$ICONNAME".png
	tar xf ./control.tar.xz
	VERSION=$(cat control | grep Version | cut -c 10-)

	cat <<-'HEREDOC' >> ./"$APP".AppDir/AppRun
	#!/bin/sh
	HERE="$(dirname "$(readlink -f "${0}")")"
	export UNION_PRELOAD="${HERE}"
	exec "${HERE}"/yandex_browser "$@"
	HEREDOC
	chmod a+x ./"$APP".AppDir/AppRun
	ARCH=x86_64 VERSION=$(./appimagetool -v | grep -o '[[:digit:]]*') ./appimagetool -s ./"$APP".AppDir
	mv ./*.AppImage ./Yandex-Browser-"$CHANNEL"-"$VERSION"-x86_64.AppImage || exit 1
}

CHANNEL="stable"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage ./

CHANNEL="beta"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage ./

CHANNEL="corporate"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage ./

cd ..
mv ./tmp/*.AppImage ./
