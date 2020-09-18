import requests
import json
import sys

#region SentinelOne credentials
s1_hostname = 'https://usea1-011.sentinelone.net/' #TODO: Put FQDN
s1_api_token = 'LP270Dv0XCYjZjeby25lJKtu2YJ4vqp0AdhiDW4B4Zh4LAfp5H0oPGH27TMhlg8i1KBGd1GGGHTrd7y5' #TODO: Put API token
s1_headers = {'content-type': 'application/json', 'Authorization': 'APIToken ' + s1_api_token}
#endregion

r = requests.get(s1_hostname + 'web/api/v1.6/agents', headers=s1_headers)
print(r)
