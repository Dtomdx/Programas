import sys

def sumador(x,y):
    primer_operando = x
    segundo_operando = y
    respuesta = primer_operando + segundo_operando
    return primer_operando,respuesta

def operacion():
    operacion = sumador(5,7)
    return operacion

z = operacion()
print(z)
print(z[0])