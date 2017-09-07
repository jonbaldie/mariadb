FROM alpine

ADD install.sh install.sh
RUN chmod +x install.sh && sh ./install.sh && rm install.sh
ADD start.sh start.sh
VOLUME ["/var/lib/mysql"]
EXPOSE 3306

CMD ["sh ./start.sh"]
