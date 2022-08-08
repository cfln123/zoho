FROM zohoanalytics/onprem:5070

ENV DB_POOL_MINSIZE=5
ENV DB_POOL_MAXSIZE=20

USER 0

RUN apt install gettext-base

COPY --from=base2/awsenv:0.2.1 /awsenv /bin/awsenv

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

USER 1000

WORKDIR /home/zaop/Zoho/Analytics/bin

ADD database_params.conf.template ../conf/

ENTRYPOINT [ "/docker-entrypoint.sh" ]