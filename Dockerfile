FROM python:3

ENV GDAL_VERSION 2.3.2
ENV ROOT_DIR /src/

WORKDIR ${ROOT_DIR}

ADD http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz ${ROOT_DIR}gdal-${GDAL_VERSION}.tar.gz

RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    build-essential \
    bash-completion \
    cmake

RUN tar -zxvf ${ROOT_DIR}gdal-${GDAL_VERSION}.tar.gz -C ${ROOT_DIR}
RUN cd ${ROOT_DIR}gdal-${GDAL_VERSION}/ \
    && ./configure --with-python \
    && make