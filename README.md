# Yandex-Browser-appimage
Unofficial AppImage for Yandex Web Browser Stable, Beta and Corporation.

# Disclaim
This repository was created with the sole purpose of building AppImage packages from official .deb packages. The packager/developer has no relationship with Yandex company nor does he support Russian government policies, in any way!

The idea of ​​opening this repository started from a request made to me by a user who uses it ([here](https://github.com/ivan-hc/AM/issues/760)), and since I do not trust distributing third-party software packages that may contain malicious software outside of the one officially released by upstream (assuming that Yandex itself releases malicious products), I decided to take responsibility for assembling these packages and distributing them, for users who need them.

You can download and extract the packages using the command
```
./*.Appimage --appimage-extract
```
The script that creates them is this: https://github.com/ivan-hc/Yandex-Browser-appimage/blob/main/yandex-builder.sh

The workflow is this: https://github.com/ivan-hc/Yandex-Browser-appimage/blob/main/.github/workflows/CI.yml

I understand that in this historical moment opening a repository like this is something controversial, and I personally am a Firefox user and a big supporter of Mozilla Firefox. If it were up to me I would abolish all browsers based on Chromium, but I also distribute the AppImages of [Google Chrome](https://github.com/ivan-hc/Chrome-appimage), [Opera](https://github.com/ivan-hc/Opera-appimage), [Vivaldi](https://github.com/ivan-hc/Vivaldi-appimage), [MS Edge](https://github.com/ivan-hc/MS-Edge-appimage) and [Chromium](https://github.com/ivan-hc/Chromium-Web-Browser-appimage), and if I do it is because I like to experiment my skills in assembling AppImage packages and enrich my database with applications that, although not officially recognized by the companies that build them, are already distributed on other platforms such as Flathub/Flatpak (see Yandex browser [here](https://flathub.org/apps/ru.yandex.Browser)) and Snapcraft/Snap (they have two, [here](https://snapcraft.io/yandex) and [here](https://snapcraft.io/yandex-browser)).

My work and my sole goal is to provide all portable applications with a home to stay, and I do it through my package manager "[AM](https://github.com/ivan-hc/AM)".

Portable applications, especially AppImages, are easy to extract and analyze, and for these my package manager provides a sandboxing system based on Bubblewrap, which is constantly improving (see https://github.com/ivan-hc/AM?tab=readme-ov-file#sandbox-an-appimage).

#### As for the security of Yandex Browser itself, or any other software you trust, it is entirely up to you.
### Use at your own risk!

PS: Although I have a Russian name, **I am not Russian nor do I speak Russian at all**!

I am 🇮🇹 ITALIAN 🇮🇹 and I only speak and understand English, Italian and Neapolitan.

---------------------------------

## Install and update it with ease

I wrote two bash scripts to install and manage the applications: [AM](https://github.com/ivan-hc/AM-Application-Manager) and [AppMan](https://github.com/ivan-hc/AppMan). Their dual existence is based on the needs of the end user.

| [**"AM" Application Manager**](https://github.com/ivan-hc/AM-Application-Manager) |
| -- |
| <sub>***If you want to install system-wide applications on your GNU/Linux distribution in a way that is compatible with [Linux Standard Base](https://refspecs.linuxfoundation.org/lsb.shtml) (all third-party apps must be installed in dedicated directories under `/opt` and their launchers and binaries in `/usr/local/*` ...), just use ["AM" Application Manager](https://github.com/ivan-hc/AM-Application-Manager). This app manager requires root privileges only to install / remove applications, the main advantage of this type of installation is that the same applications will be available to all users of the system.***</sub>
[![Readme](https://img.shields.io/github/stars/ivan-hc/AM-Application-Manager?label=%E2%AD%90&style=for-the-badge)](https://github.com/ivan-hc/AM-Application-Manager/stargazers) [![Readme](https://img.shields.io/github/license/ivan-hc/AM-Application-Manager?label=&style=for-the-badge)](https://github.com/ivan-hc/AM-Application-Manager/blob/main/LICENSE)

| [**"AppMan"**](https://github.com/ivan-hc/AppMan)
| --
| <sub>***If you don't want to put your app manager in a specific path but want to use it portable and want to install / update / manage all your apps locally, download ["AppMan"](https://github.com/ivan-hc/AppMan) instead. With this script you will be able to decide where to install your applications (at the expense of a greater consumption of resources if the system is used by more users). AppMan is portable, all you have to do is write the name of a folder in your `$HOME` where you can install all the applications available in [the "AM" database](https://github.com/ivan-hc/AM-Application-Manager/tree/main/programs), and without root privileges.***</sub>
[![Readme](https://img.shields.io/github/stars/ivan-hc/AppMan?label=%E2%AD%90&style=for-the-badge)](https://github.com/ivan-hc/AppMan/stargazers) [![Readme](https://img.shields.io/github/license/ivan-hc/AppMan?label=&style=for-the-badge)](https://github.com/ivan-hc/AppMan/blob/main/LICENSE)
