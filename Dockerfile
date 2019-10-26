FROM centos:8

WORKDIR /templates

RUN yum install python3 python3-pip -y && \
    yum clean all && \
    pip3 install -U Jinja2

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.4.1-x86_64.rpm && \
    rpm -vi metricbeat-7.4.1-x86_64.rpm && \
    metricbeat modules enable mongodb

COPY . .

RUN chmod +x entrypoint.sh

CMD [ "./entrypoint.sh" ]