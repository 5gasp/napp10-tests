import requests

def try_endpoint(host, port):
    url = f"http://{host}:{port}/route/v1/driving/26.1272718,44.4930386;26.104591,44.4643624"
    headers = {}

    try:
        r = requests.get(url=url, headers=headers)
        if not r.ok:
            return 'ERROR'
        return str(r.json()).replace("'", "\"")  # We assume that this endpoint will return a JSON response
    except Exception as e:
        print(e)
        return 'ERROR'

if __name__ == '__main__':
    print(try_endpoint("localhost", "5000"))
