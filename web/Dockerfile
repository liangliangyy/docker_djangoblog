FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD ./codes/DjangoBlog/ /code/
RUN pip install -Ur requirements.txt -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com
RUN python manage.py collectstatic --noinput
#RUN python manage.py makemigrations
#RUN manage.py migrate
CMD [ "/code/DjangoBlog/manage.py" ]