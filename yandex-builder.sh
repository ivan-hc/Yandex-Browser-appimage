#!/bin/sh

APP=yandex-browser

# TEMPORARY DIRECTORY
mkdir -p tmp
cd ./tmp || exit 1

# DOWNLOAD APPIMAGETOOL
if ! test -f ./appimagetool; then
	wget -q https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O appimagetool
	chmod a+x ./appimagetool
fi

# CREATE CHROME BROWSER APPIMAGES

_create_yandex_appimage(){
	ar x ./*.deb
	tar xf ./data.tar.xz
	mkdir "$APP".AppDir
	mv ./opt/*/*/* ./"$APP".AppDir/
	mv ./usr/share/applications/yandex*.desktop ./"$APP".AppDir/
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

	ARCH=x86_64 ./appimagetool --comp zstd --mksquashfs-opt -Xcompression-level --mksquashfs-opt 20 \
	-u "gh-releases-zsync|$GITHUB_REPOSITORY_OWNER|Yandex-Browser-appimage|continuous|*-$CHANNEL-*x86_64.AppImage.zsync" \
	./"$APP".AppDir Yandex-Browser-"$CHANNEL"-"$VERSION"-x86_64.AppImage || exit 1
}

wget --recursive --tries=10 --no-parent "index.html*" https://repo.yandex.ru/yandex-browser/deb/pool/main/y/
mv ./repo.yandex.ru/yandex-browser/deb/pool/main/y/*/*deb . || exit 1

CHANNEL="stable"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && mv ./*"$CHANNEL"*.deb ./"$CHANNEL"/ && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage* ./

CHANNEL="beta"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && mv ./*"$CHANNEL"*.deb ./"$CHANNEL"/ && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage* ./

CHANNEL="corporate"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && mv ./*"$CHANNEL"*.deb ./"$CHANNEL"/ && cd "$CHANNEL" || exit 1
_create_yandex_appimage
cd ..
mv ./"$CHANNEL"/*.AppImage* ./

cd ..
mv ./tmp/*.AppImage* ./
