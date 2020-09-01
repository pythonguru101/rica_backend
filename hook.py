import requests

URL = "https://webhook.site/#!/e4f0bda0-57c2-40f2-be1d-49fe87556b0a"

r = requests.get(url=URL)

data = r.json()

print(data)
