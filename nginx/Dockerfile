FROM nginx
ADD sites-enabled/ /etc/nginx/sites-enabled
ADD sites-available/ /etc/nginx/sites-available
ADD nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
#RUN chown -R www-data:www-data /code/DjangoBlog/