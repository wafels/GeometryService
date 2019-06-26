FROM python:3-stretch

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget git cmake ninja-build
RUN apt-get -y autoremove && apt-get clean && apt-get autoclean

RUN wget -nv https://packagecloud.io/github/git-lfs/packages/debian/stretch/git-lfs_2.7.2_amd64.deb/download
RUN dpkg -i download

RUN git clone https://github.com/Helioviewer-Project/GeometryService.git
RUN cd /root && mkdir build && cd build && cmake /GeometryService -G Ninja && ninja install

EXPOSE 7789
