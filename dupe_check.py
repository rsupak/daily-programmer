import time


def import_resources():
    with open('resources.yml', 'r') as f:
        data = yaml.load(f)

    unique_resources = remove_duplicates(data)

def remove_duplicates(data):
    unique_resources = []
    resource_dict = {}
    for resource in data:
        if not resource_dict.get(resource['url']):
            resource_dict[resource['url']] = True
            unique_resources.append(resource)
        else:
            print(f"Encountered a duplicate resource in resources:yml {resource['url']}")
    return unique_resources


print(remove_duplicates(import_resources()))
