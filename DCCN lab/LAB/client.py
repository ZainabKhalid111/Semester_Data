import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect((socket.gethostname(), 6061))

while True:
    msg = s.recv(2024)
    print("Message is : ", msg.decode())

