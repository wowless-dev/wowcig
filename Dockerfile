FROM google/cloud-sdk:slim
WORKDIR /opt/wowcig

COPY setup.sh ./
RUN bash setup.sh

COPY query.sh run.sh wowcig.lua ./
ENTRYPOINT ["bash", "run.sh"]
