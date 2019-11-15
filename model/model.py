from PyQt5.QtCore import QObject, pyqtSignal
import re
import pymysql
from PyQt5.QtWidgets import QApplication, QDialog, QMessageBox

class Model(QDialog):
    def __init__(self):
        super().__init__()
        self.nombre = ""
        self.apellido = ""
        self.dni = ""
        self.edad = ""

    def validar_lineEdit_nombre(self, value):
        self.nombre = value
        validar = re.match('^[a-z]+$', value, re.I)
        return self.nombre, validar

    def validar_lineEdit_apellido(self, value):
        self.apellido = value
        validar = re.match('^[a-z]+$', value, re.I)
        return self.apellido, validar
    #dni = codigo
    def validar_lineEdit_dni(self, value):
        self.dni = value
        validar = re.match('[0-9]', value, re.I)
        return self.dni, validar
    #4 = edad
    def validar_lineEdit_4(self, value):
        self.edad = value
        validar = re.match('[0-9]', value, re.I)
        return self.edad, validar

    def validar_lineEdit_nivel(self, value):
        self.nivel = value
        validar = re.match('^[a-z]+$', value, re.I)
        return self.nivel, validar

    def validar_lineEdit_i(self, value):
        self.i = value
        validar = re.match('[0-9]', value, re.I)
        return self.i, validar

    def validar_lineEdit_f(self, value):
        self.f = value
        validar = re.match('[0-9]', value, re.I)
        return self.f, validar

    def validar_lineEdit_cap_inv(self, value):
        self.cap_inv = value
        validar = re.match('[0-9]', value, re.I)
        return self.cap_inv, validar

    def validar_lineEdit_telef(self, value):
        self.telef = value
        validar = re.match('[0-9]', value, re.I)
        return self.telef, validar

    def validar_lineEdit_cel(self, value):
        self.cel = value
        validar = re.match('[0-9]', value, re.I)
        return self.cel, validar

    def validar_lineEdit_dir_domic(self, value):
        self.dir_domic = value
        validar = re.match('^[a-z]+$', value, re.I)
        return self.dir_domic, validar

    def validar_lineEdit_carr_pro(self, value):
        self.carr_pro = value
        validar = re.match('^[a-z]+$', value, re.I)
        return self.carr_pro, validar


    def guardar_formulario(self, v_nombre, v_apellido, v_dni, v_4, v_nivel, v_i, v_f, v_cap, v_telef, v_cel, v_dir, v_carr):
        conn = pymysql.connect(host = "localhost", user= "root", passwd="toor", db="registro_cliente")
        try:
            with conn:
                cursor = conn.cursor()
                cursor.execute("INSERT INTO cliente(nombre_cli, apellido_cli, codigo_cli, edad_cli, nivel_cli, i_cli, f_cli, cap_inv_cli, telef_cli, cel_cli, zona_vivi_cli, oficio_cli)"
                               "VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" % (v_nombre, v_apellido, v_dni, v_4, v_nivel, v_i, v_f, v_cap, v_telef, v_cel, v_dir, v_carr))

                QMessageBox.about(self, "Coneccion", "Data insertado")
                self.close()
        except:
            QMessageBox.about(self, "Coneccion", "Data no insertado")
            self.close()








