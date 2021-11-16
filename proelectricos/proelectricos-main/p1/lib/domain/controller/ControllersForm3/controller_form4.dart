import 'package:get/get.dart';

class ControllerForm4 extends GetxController {
  RxList<RxBool> valorswparte4 = RxList.generate(27, (_) => true.obs);

  //Lo de abajo ya no es necesario. Pero no se va a borrar hasta hacer unas pruebas
  /*void cambiarvalorparte3(bool valor, int i) {
    valorswparte3[i].value = valor;
  }

  void cambiarvalorparte4(bool valor, int i) {
    valorswparte4[i].value = valor;
  }*/
}
