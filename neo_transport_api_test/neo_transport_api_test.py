import requests

def try_endpoint(host, port):
    url = f"http://{host}:{port}/tenant/order/stats?date=2022-10-17/"
    headers = {"Authorization": "Basic replace-with-token"}

    try:
        r = requests.get(url=url, headers=headers)
        if not r.ok:
            return 'ERROR'
        return r.json()  # We assume that this endpoint will return a JSON response
    except Exception as e:
        print(e)
        return 'ERROR'

if __name__ == '__main__':
    print(try_endpoint("localhost", "3000"))
