FROM tutum/lamp

RUN apt-get install -y curl && \
    git clone -b v4.1.13 https://github.com/thebuggenie/thebuggenie /var/www/thebuggenie

WORKDIR /var/www/thebuggenie

RUN curl -sS https://getcomposer.org/installer | php

RUN apt-get -y update && \
    apt-get -y install php5-gd php5-curl

RUN php composer.phar install

EXPOSE 80 3306

CMD ["/run.sh"]
