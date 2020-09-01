# import socket
# import sys

# #SOCK_STREAM : transport protocol type cho cac socket TCP
# stream_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# host = 'localhost'
# port = 8080

# sever_adress = ((host,port))

# print ("connecting..")

# stream_socket.connect(sever_adress)

# #send data
# mesage = "Hello sever i'm client"
# stream_socket.sendall(mesage)

# #response
# data = stream_socket.recv(10)
# print (data)

# print ("socket close")
# stream_socket.close()


import socket
import sys

HOST, PORT = "localhost", 8181
data = " hello i'm from Client ".join(sys.argv[1:])

# Create a socket (SOCK_STREAM means a TCP socket)
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    # Connect to server and send data
    sock.connect((HOST, PORT))
    sock.sendall(bytes(data + "hello i'm from Client\n", "utf-8"))

    # Receive data from the server and shut down
    received = str(sock.recv(1024), "utf-8")

print("Sent:     {}".format(data))
print("Received: {}".format(received))