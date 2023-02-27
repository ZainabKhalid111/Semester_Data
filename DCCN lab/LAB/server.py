import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((socket.gethostname(), 6061))
s.listen(5)

clientSoc, address = s.accept()

print("\n Connection estblished : ", address)
while True:
    msg = input("Enter msg : ")

    clientSoc.send(bytes(msg, 'utf-8'))
clientSoc.close()