FROM ubuntu:22.04

RUN sh -c "echo deb-src http://archive.ubuntu.com/ubuntu/ jammy main restricted >> /etc/apt/sources.list" \
 && sh -c "echo deb-src http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted >> /etc/apt/sources.list" \
 && sh -c "echo deb-src http://security.ubuntu.com/ubuntu/ jammy-security main restricted >> /etc/apt/sources.list" \
 && sh -c "echo deb-src http://security.ubuntu.com/ubuntu/ jammy-security universe >> /etc/apt/sources.list" \
 && sh -c "echo deb-src http://security.ubuntu.com/ubuntu/ jammy-security multiverse >> /etc/apt/sources.list"

RUN apt-get update
RUN apt-get install -y sudo libpoco-dev python3-polib libcap-dev npm libpam-dev \
                       libzstd-dev wget git build-essential libtool libcap2-bin python3-lxml \
                       libpng-dev libcppunit-dev pkg-config fontconfig snapd chromium-browser \
                       lsb-release gcc-12 g++-12

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 3665 --slave /usr/bin/g++ g++ /usr/bin/g++-12

RUN apt-get build-dep -y libreoffice

RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip install lxml
RUN pip install polib
