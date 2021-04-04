#!/usr/bin/env python

import yaml


class Yaml:
    def __init__(self, filePath=None):
        self.filePath = filePath

    def read(self):
        if self.filePath is not None:
            with open(self.filePath, "r") as stream:
                data = yaml.safe_load(stream)
                return data

    def write(self, data="empty"):
        if self.filePath is not None:
            with io.open(self.filePath, "w", encoding="utf8") as outfile:
                yaml.dump(data, outfile, default_flow_style=False, allow_unicode=True)


if __name__ == "__main__":
    Yaml()
