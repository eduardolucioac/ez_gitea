# ez_gitea - A painless and ez Gitea setup

<img src="./icon/gitea.svg" height="250">

The purpose of this project is to allow you to **easily install and use Gitea like a desktop application**.

This project was initially thought to be used with the Manjaro and Ubuntu Linux distributions, but with a few adaptations it can be used with any other platform that uses docker-compose - although a Linux platform is necessary if you want to enjoy all the facilities.

**IMPORTANT:** My life, my work and my passion is free software. Corrections, tweaks and improvements are very welcome (**pull requests** 😉)! Please consider giving us a ⭐, fork, support this project or even visit our professional profile (see [About](#about)).

**Thanks!** 🤗

# Table of Contents

- [Install ez_gitea](#install-ez_gitea)
  * [Install Google Chrome](#install-google-chrome)
    + [If Ubuntu](#if-ubuntu)
    + [If Manjaro](#if-manjaro)
  * [Install Git](#install-git)
    + [If Ubuntu](#if-ubuntu-1)
    + [If Manjaro](#if-manjaro-1)
  * [Install Docker Community Edition (CE)](#install-docker-community-edition-ce)
    + [If Ubuntu](#if-ubuntu-2)
    + [If Manjaro](#if-manjaro-2)
    + [Manage Docker as a non-root user](#manage-docker-as-a-non-root-user)
  * [Install Docker Compose](#install-docker-compose)
  * [Clone ez_gitea](#clone-ez_gitea)
  * [Configure Gitea (environment variables file)](#configure-gitea-environment-variables-file)
  * [Start Gitea](#start-gitea)
  * [Integration with your GUI](#integration-with-your-gui)
- [About](#about)

# Install ez_gitea

## Install Google Chrome

### If Ubuntu

Updating and add the Google Chrome repository GPG key...

```
apt-get -y update
apt-get -y upgrade # Updating the OS is a good practice. =D
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```

Add the Google Chrome repository...

```
add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
```

Install Google Chrome...

```
apt-get -y install google-chrome-stable
```

### If Manjaro

```
pamac install --no-confirm yay
yay -Syyuu --noconfirm # Updating the OS is a good practice. =D
yay -S --noconfirm google-chrome
```

## Install Git

### If Ubuntu

```
apt-get -y install git
```

### If Manjaro

```
yay -S --noconfirm git
```

## Install Docker Community Edition (CE)

### If Ubuntu

We are going to install Docker from the official Docker repository (latest version).

Install needed packages...

```
apt-get -y install apt-transport-https
apt-get -y install ca-certificates
apt-get -y install software-properties-common
```

Add the Docker repository GPG key...

```
wget -q -O - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository...

```
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

Configure to install from the Docker Community Edition (CE) repository...

```
apt-cache policy docker-ce
```

Install Docker...

```
apt-get -y install docker-ce
```

Check Docker version...

```
docker --version
```

Check if Docker daemon is running...

```
systemctl status docker.service
```

### If Manjaro

Packages to install Docker are already there on the official repository of Manjaro, thus no need to add anything extra.

Install needed packages and Docker...

```
yay -S --noconfirm docker
```

Enable and start Docker services...

```
systemctl enable docker.service
systemctl start docker.service
```

Check if Docker daemon is running...

```
docker --version
```

... and check Docker version...

```
systemctl status docker.service
```

### Manage Docker as a non-root user

Create the *docker* group...

```
groupadd docker
```

Add your user to the *docker* group (as your user)...

```
sudo usermod -aG docker $USER
```

**IMPORTANT:** Use `sudo` (your user), not `sudo su` (root)!

Run the following command to activate the changes to groups (as your user) ...

```
newgrp docker
```

Verify that you can run docker commands without sudo...

```
docker run hello-world
```

**IMPORTANT:** In order for these changes effectively take effect, the OS must be restarted.

## Install Docker Compose

We are going to install Docker Compose (latest version) from its official repository on Github.

**NOTE:** This scheme will work on any Linux distribution.

Download Docker Compose...

```
DC_LTST_VER=$(curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
OS_TYPE=$(uname -s)
OS_ARCH=$(uname -m)
curl -L "https://github.com/docker/compose/releases/download/$DC_LTST_VER/docker-compose-$OS_TYPE-$OS_ARCH" -o /usr/local/bin/docker-compose
```

Set as an executable...

```
chmod +x /usr/local/bin/docker-compose
```

Verify that the installation was successful...

```
docker-compose --version
```

## Clone ez_gitea

As a suggestion you can clone the ez_gitea repository in your home folder...

```
cd ~
git clone https://github.com/eduardolucioac/ez_gitea.git
```

**TIP:** Make the ez_gitea folder hidden to improve your home folder organization and protect your setup...

```
cd ~
mv ~/ez_gitea ~/.ez_gitea
```
.

## Configure Gitea (environment variables file)

Use the environment variables in the *SETTINGS* file (project root) to configure Gitea...

```
nano ~/.ez_gitea/SETTINGS
```

## Start Gitea

```
bash ~/.ez_gitea/script/ez_gitea.bash
```

**Done!** 😉

## Integration with your GUI

There are many and many of ways to integrate ez_gitea (gitea) with your GUI. Therefore, we are not going to address these details here, but as a generic example there is the *Gitea.desktop* file at the root of this project...

```
[Desktop Entry]
Comment=Gitea is a community managed lightweight code hosting solution written in Go. It is published under the MIT license.
Exec=bash /home/<YOUR_USER>/.ez_gitea/script/gitea.bash
GenericName=A painless self-hosted Git service.
Icon=/home/<YOUR_USER>/.ez_gitea/icon/gitea.svg
Name=Gitea
```

**TIP:** If your GUI is KDE and you want to ensure that the application starts up maximized, replace the command in *Exec* by `kstart5 --maximize bash /home/<YOUR_USER>/.ez_gitea/script/gitea.bash`.

# About

ez_gitea 🄯 BSD-3-Clause  
Eduardo Lúcio Amorim Costa  
Brazil-DF  
https://www.linkedin.com/in/eduardo-software-livre/

<img border="0" alt="Brazil-DF" src="http://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Map_of_Brazil_with_flag.svg/180px-Map_of_Brazil_with_flag.svg.png" height="15%" width="15%"/>
