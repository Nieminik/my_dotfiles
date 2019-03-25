import socket
from http.server import HTTPServer, SimpleHTTPRequestHandler
import argparse

class MyHandler(SimpleHTTPRequestHandler):
    def do_get(self):
        if self.path == '/ip':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write('Your IP address is %s' % self.client_address[0])
            return
        else:
            return SimpleHTTPRequestHandler.do_get(self)

class HTTPServerV6(HTTPServer):
    address_family = socket.AF_INET6

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='A simple ipv6 python http server.')
    parser.add_argument('port', metavar='[port]', type=int, help='a port')
    args = parser.parse_args()

    server = HTTPServerV6(('::', args.port), MyHandler)
    server.serve_forever()
