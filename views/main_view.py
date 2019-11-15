from PyQt5.QtWidgets import QMainWindow
from PyQt5.QtCore import pyqtSlot
from PyQt5 import uic

from views.main_view_ui import  Ui_MainWindow

class MainView(QMainWindow):
    def __init__(self, model):
        super().__init__()


        self._model = model
        self._ui = Ui_MainWindow()
        self._ui.setupUi(self)

        self._ui.lineEdit_nombre.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_nombre)
        self._ui.lineEdit_apellido.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_apellido)
        self._ui.lineEdit_dni.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_dni)
        #lineEdit_4 = edad
        self._ui.lineEdit_4.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_4)
        self._ui.lineEdit_nivel.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_nivel)
        self._ui.lineEdit_i.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_i)
        self._ui.lineEdit_f.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_f)
        self._ui.lineEdit_cap_inv.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_cap_inv)
        self._ui.lineEdit_telef.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_telef)
        self._ui.lineEdit_cel.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_cel)
        self._ui.lineEdit_dir_domic.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_dir_domic)
        self._ui.lineEdit_carr_pro.textChanged.connect(self._ui.controlador.handler_validar_lineEdit_carr_pro)

        #botones
        self._ui.pushButton_validar.clicked.connect(self._ui.controlador.handler_validar_formulario)
        self._ui.pushButton_guardar.clicked.connect(self._ui.controlador.handler_guardar_formulario)


