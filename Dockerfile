FROM python:2

RUN echo "deb http://ftp.belnet.be/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install cmake zlib1g-dev libpcre3-dev libssl-dev

COPY GeometryService /root/GeometryService
RUN cd /root && mkdir build && cd build && cmake ../GeometryService && make install

EXPOSE 7789

