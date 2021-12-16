FROM python:3.10-buster
WORKDIR /opt/wowcig

COPY setup.sh ./
RUN bash setup.sh

COPY wowcig.lua nginx.conf run.sh ./
ENTRYPOINT ["tini", "--", "bash", "run.sh"]
