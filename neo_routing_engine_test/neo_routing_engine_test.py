import requests
import json
from datetime import datetime

def switch(option, host, port):
  if option == "ROUTING-ENGINE":
    return f"http://{host}:{port}/tenant/routes", {"vehicles":[],"shipments":[],"queryOnly": True,"startTimestamp": int(round(datetime.now().timestamp()))}, {"authorization": "Basic replace-with-token"}, "POST"
  elif option == "ROUTING-ENGINE-ESTIMATION":
    return f"http://{host}:{port}/tenant/routes/estimation", {"vehicleCapacities":[],"shipments":[],"startTimestamp": int(round(datetime.now().timestamp()))}, {"authorization": "Basic replace-with-token"}, "POST"

def try_endpoint(option, host, port):
  url, body, headers, method = switch(option, host, port)
  try:
    if method == 'POST':
      r = requests.post(url=url, data=json.dumps(body), headers=headers)
    if option == "ROUTING-ENGINE" or option == "ROUTING-ENGINE-ESTIMATION":
      new_url = ''
      if option == "ROUTING-ENGINE":
        new_url = f"http://{host}:{port}/tenant/routes/" + r.text
      if option == "ROUTING-ENGINE-ESTIMATION":
        new_url = f"http://{host}:{port}/tenant/routes/estimation/" + r.text
      if not new_url:
        return 'ERROR'
      else:
        r = requests.get(url=new_url, headers=headers, data=body)
        try:
          return r.text
          # if response['status'] not in  ['pending', 'finished'] :
          #   return 'ERROR'

        except Exception as e:
          print(e)
          return 'ERROR'
  except Exception as e:
    print(e)
    return 'ERROR'

  if not r.ok:
    return 'ERROR'
  return r.text

if __name__ == '__main__':
  print(try_endpoint("ROUTING-ENGINE", "localhost", "3002"))
