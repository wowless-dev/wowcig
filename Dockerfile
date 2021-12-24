FROM python:3.10-buster
WORKDIR /opt/wowcig

COPY setup.sh ./
RUN bash setup.sh

COPY run.sh wowcig.lua ./
ENTRYPOINT ["tini", "--", "bash", "run.sh"]
