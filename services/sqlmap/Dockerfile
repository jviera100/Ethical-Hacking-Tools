FROM python:alpine

RUN apk add --no-cache git
RUN git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
WORKDIR /opt/sqlmap
ENTRYPOINT ["python3", "sqlmap.py"]
CMD ["--help"]