FROM ubuntu/nginx

ENV TZ Europe/Minsk

RUN apt-get update && apt-get install nano

RUN mkdir -p /home/ubuntu/custom-ubuntu-nginx/51ame.ddns.net

ADD ./51ame.ddns.net /home/ubuntu/custom-ubuntu-nginx/51ame.ddns.net
ADD ./ /home/ubuntu/custom-ubuntu-nginx/

RUN cp /home/ubuntu/custom-ubuntu-nginx/51ame.ddns.net/index.html /var/www/html/index.html
RUN cp /home/ubuntu/custom-ubuntu-nginx/51ame.ddns.net/cpu.html /var/www/html/cpu.html
RUN cp /home/ubuntu/custom-ubuntu-nginx/51ame.ddns.net/background.jpg /var/www/html/background.jpg


RUN chmod +x /home/ubuntu/custom-ubuntu-nginx/logscript.sh
RUN chmod +x /home/ubuntu/custom-ubuntu-nginx/cpu-script.sh
RUN chmod +x /home/ubuntu/custom-ubuntu-nginx/nohup.sh

RUN cp /home/ubuntu/custom-ubuntu-nginx/nohup.sh /docker-entrypoint.d/nohup.sh
