FROM perl:alpine

RUN apk add --no-cache git
RUN git clone https://github.com/sullo/nikto.git /opt/nikto
WORKDIR /opt/nikto/program
ENTRYPOINT ["perl", "nikto.pl"]
CMD ["-h"]