FROM python:3

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install zlib1g-dev libpcre3-dev libssl-dev
RUN apt-get -y install wget git cmake
RUN apt-get -y autoremove && apt-get clean && apt-get autoclean

RUN wget -nv https://packagecloud.io/github/git-lfs/packages/debian/jessie/git-lfs_2.6.1_amd64.deb/download
RUN dpkg -i download

RUN git clone https://github.com/Helioviewer-Project/GeometryService.git
RUN cd /root && mkdir build && cd build && cmake /GeometryService && make -j4 install

EXPOSE 7789
