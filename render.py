#!/usr/bin/env python3

import os
from jinja2 import Environment, FileSystemLoader


def getVariables():
    return {"mongodb_url": os.environ["MONGODB_URL"],
            "kibana_url": os.environ["KIBANA_URL"],
            "elasticsearch_url": os.environ["ELASTICSEARCH_URL"]}


def renderFile(filename):
    env = Environment(loader=FileSystemLoader('/templates'))
    template = env.get_template(filename)
    output_from_parsed_template = template.render(getVariables())
    print(output_from_parsed_template)

    # to save the results
    with open(filename.replace('.j2', ''), "w") as fh:
        fh.write(output_from_parsed_template)


renderFile('metricbeat.yml.j2')
renderFile('mongodb.yml.j2')
