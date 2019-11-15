from PyQt5.QtCore import QObject, pyqtSlot
from PyQt5.QtWidgets import QApplication, QDialog, QMessageBox

import sys
from model.model import Model

class MainController(QDialog):
    def __init__(self, una_ventana):
        super().__init__()
        self.ventana = una_ventana
        self._model = Model()


    def handler_validar_lineEdit_nombre(self):
        valor_nombre = self.ventana.lineEdit_nombre.text()
        valor_rpta_nombre = self._model.validar_lineEdit_nombre(valor_nombre)
        if valor_rpta_nombre[0] == "":
            self.ventana.lineEdit_nombre.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_nombre[1]:
            self.ventana.lineEdit_nombre.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_nombre.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_apellido(self):
        valor_apellido = self.ventana.lineEdit_apellido.text()
        valor_rpta_apellido = self._model.validar_lineEdit_nombre(valor_apellido)
        if valor_rpta_apellido[0] == "":
            self.ventana.lineEdit_apellido.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_apellido[1]:
            self.ventana.lineEdit_apellido.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_apellido.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_dni(self):
        valor_dni = self.ventana.lineEdit_dni.text()
        valor_rpta_dni = self._model.validar_lineEdit_dni(valor_dni)
        if valor_rpta_dni[0] == "":
            self.ventana.lineEdit_dni.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_dni[1]:
            self.ventana.lineEdit_dni.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_dni.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_4(self):
        valor_4 = self.ventana.lineEdit_4.text()
        valor_rpta_4 = self._model.validar_lineEdit_4(valor_4)
        if valor_rpta_4[0] == "":
            self.ventana.lineEdit_4.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_4[1]:
            self.ventana.lineEdit_4.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_4.setStyleSheet("border: 1px solid green;")
            return True


    def handler_validar_lineEdit_nivel(self):
        valor_nivel = self.ventana.lineEdit_nivel.text()
        valor_rpta_nivel = self._model.validar_lineEdit_nivel(valor_nivel)
        if valor_rpta_nivel[0] == "":
            self.ventana.lineEdit_nivel.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_nivel[1]:
            self.ventana.lineEdit_nivel.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_nivel.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_i(self):
        valor_i = self.ventana.lineEdit_i.text()
        valor_rpta_i = self._model.validar_lineEdit_i(valor_i)
        if valor_rpta_i[0] == "":
            self.ventana.lineEdit_i.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_i[1]:
            self.ventana.lineEdit_i.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_i.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_f(self):
        valor_f = self.ventana.lineEdit_f.text()
        valor_rpta_f = self._model.validar_lineEdit_f(valor_f)
        if valor_rpta_f[0] == "":
            self.ventana.lineEdit_f.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_f[1]:
            self.ventana.lineEdit_f.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_f.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_cap_inv(self):
        valor_cap_inv = self.ventana.lineEdit_cap_inv.text()
        valor_rpta_cap_inv = self._model.validar_lineEdit_cap_inv(valor_cap_inv)
        if valor_rpta_cap_inv[0] == "":
            self.ventana.lineEdit_cap_inv.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_cap_inv[1]:
            self.ventana.lineEdit_cap_inv.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_cap_inv.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_telef(self):
        valor_telef = self.ventana.lineEdit_telef.text()
        valor_rpta_telef = self._model.validar_lineEdit_telef(valor_telef)
        if valor_rpta_telef[0] == "":
            self.ventana.lineEdit_telef.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_telef[1]:
            self.ventana.lineEdit_telef.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_telef.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_cel(self):
        valor_cel = self.ventana.lineEdit_cel.text()
        valor_rpta_cel = self._model.validar_lineEdit_cel(valor_cel)
        if valor_rpta_cel[0] == "":
            self.ventana.lineEdit_cel.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_cel[1]:
            self.ventana.lineEdit_cel.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_cel.setStyleSheet("border: 1px solid green;")
            return True



    def handler_validar_lineEdit_dir_domic(self):
        valor_dir_domic = self.ventana.lineEdit_dir_domic.text()
        valor_rpta_dir_domic = self._model.validar_lineEdit_dir_domic(valor_dir_domic)
        if valor_rpta_dir_domic[0] == "":
            self.ventana.lineEdit_dir_domic.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_dir_domic[1]:
            self.ventana.lineEdit_dir_domic.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_dir_domic.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_lineEdit_carr_pro(self):
        valor_carr_pro = self.ventana.lineEdit_carr_pro.text()
        valor_rpta_carr_pro = self._model.validar_lineEdit_carr_pro(valor_carr_pro)
        if valor_rpta_carr_pro[0] == "":
            self.ventana.lineEdit_carr_pro.setStyleSheet("border: 1px solid yellow;")
            return False
        elif not valor_rpta_carr_pro[1]:
            self.ventana.lineEdit_carr_pro.setStyleSheet("border: 1px solid red;")
        else:
            self.ventana.lineEdit_carr_pro.setStyleSheet("border: 1px solid green;")
            return True

    def handler_validar_formulario(self):
        if self.handler_validar_lineEdit_nombre() and self.handler_validar_lineEdit_apellido() and self.handler_validar_lineEdit_dni()\
                and self.handler_validar_lineEdit_4() and self.handler_validar_lineEdit_nivel() and self.handler_validar_lineEdit_i()\
                and self.handler_validar_lineEdit_f() and self.handler_validar_lineEdit_cap_inv() and self.handler_validar_lineEdit_carr_pro()\
                and self.handler_validar_lineEdit_dir_domic() and self.handler_validar_lineEdit_telef() and self.handler_validar_lineEdit_cel():
            QMessageBox.information(self, "Formulario correcto", "Validacion correcta", QMessageBox.Discard)
        else:
            QMessageBox.warning(self, "Formulario incorrecto", "Validacion incorrecta", QMessageBox.Discard)

    def handler_guardar_formulario(self):
        self._model.guardar_formulario( self.ventana.lineEdit_nombre.text(), \
                                        self.ventana.lineEdit_apellido.text(),\
                                        self.ventana.lineEdit_dni.text(), \
                                        self.ventana.lineEdit_4.text(), \
                                        self.ventana.lineEdit_nivel.text(), \
                                        self.ventana.lineEdit_i.text(),\
                                        self.ventana.lineEdit_f.text(),\
                                        self.ventana.lineEdit_cap_inv.text(),\
                                        self.ventana.lineEdit_telef.text(),\
                                        self.ventana.lineEdit_cel.text(),\
                                        self.ventana.lineEdit_dir_domic.text(),\
                                        self.ventana.lineEdit_carr_pro.text() )







