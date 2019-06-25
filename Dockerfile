FROM ubuntu:bionic

RUN apt update && apt install -y build-essential git curl autoconf bison libtool libssl-dev libcurl4-openssl-dev libxml2-dev libreadline7 libreadline-dev libzip-dev libzip4 openssl pkg-config zlib1g-dev re2c sqlite3 libsqlite3-dev libffi-dev libonig-dev libsodium-dev

WORKDIR /tmp

RUN curl https://codeload.github.com/php/php-src/tar.gz/php-7.4.0alpha2 | tar xvz && \
    cd php-src-php-7.4.0alpha2 && \
    autoconf && \
    ./buildconf --force && \
    ./configure --with-readline --with-openssl --with-curl --with-ffi --enable-mbstring --enable-pcntl --enable-sockets --with-sodium && \
    make && \
    make install && \
    cd .. && \
    rm -rf php-src-php-7.4.0alpha2
