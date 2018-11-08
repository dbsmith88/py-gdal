FROM python:3

ENV GDAL_VERSION 2.3.2
ENV ROOT_DIR /src/

WORKDIR ${ROOT_DIR}

ADD http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz ${ROOT_DIR}gdal-${GDAL_VERSION}.tar.gz

#RUN apt-get update -y && apt-get install -y \
#    software-properties-common \
#    build-essential \
#    bash-completion \
#    cmake

RUN tar -zxvf ${ROOT_DIR}gdal-${GDAL_VERSION}.tar.gz -C ${ROOT_DIR}
RUN cd ${ROOT_DIR}gdal-${GDAL_VERSION}/ \
    && ./configure \
        --with-geos \
        --with-geotiff=internal \
        --with-hide-internal-symbols \
        --with-libtiff=internal \
        --with-libz=internal \
        --with-threads \
        --without-bsb \
        --without-cfitsio \
        --without-cryptopp \
        --without-curl \
        --without-dwgdirect \
        --without-ecw \
        --without-expat \
        --without-fme \
        --without-freexl \
        --without-gif \
        --without-gif \
        --without-gnm \
        --without-grass \
        --without-grib \
        --without-hdf4 \
        --without-hdf5 \
        --without-idb \
        --without-ingres \
        --without-jasper \
        --without-jp2mrsid \
        --without-jpeg \
        --without-kakadu \
        --without-libgrass \
        --without-libkml \
        --without-libtool \
        --without-mrf \
        --without-mrsid \
        --without-mysql \
        --without-netcdf \
        --without-odbc \
        --without-ogdi \
        --without-openjpeg \
        --without-pcidsk \
        --without-pcraster \
        --without-pcre \
        --without-perl \
        --without-pg \
        --without-php \
        --without-png \
        --without-python \
        --without-qhull \
        --without-sde \
        --without-sqlite3 \
        --without-webp \
        --without-xerces \
        --without-xml2
    && make