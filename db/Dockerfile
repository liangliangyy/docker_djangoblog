FROM mysql


#ADD startup /etc/mysql/startup

#RUN chown -R mysql:root /var/lib/mysql/
RUN chown -R mysql:mysql /var/lib/mysql/
RUN chown -R  mysql /var/lib/mysql
RUN chgrp -R  mysql /var/lib/mysql

RUN chown -R mysql:root /var/lib/mysql/
ADD my.cnf /etc/mysql/conf.d/my.cnf

#COPY my.conf /etc/mysql/conf.d/my.conf

CMD ["mysqld"]

EXPOSE 3306