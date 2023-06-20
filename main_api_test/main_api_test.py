
import requests

def try_endpoint(host, port):
  url = f"http://{host}:{port}/transport/bus/order"
  headers = {"Authorization":"Bearer replace-with-bearer-token"}

  try:
    r = requests.get(url=url, headers=headers)
    if not r.ok:
      return 'ERROR'
    return r.text
  except Exception as e:
      print(e)
      return 'ERROR'

if __name__ == '__main__':
    print(try_endpoint("localhost", "3003"))
