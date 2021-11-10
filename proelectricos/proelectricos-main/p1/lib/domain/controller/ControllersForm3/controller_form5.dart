import 'package:get/get.dart';

class ControllerForm5 extends GetxController {
  RxList<RxBool> valorswparte2 = RxList.generate(9, (_) => true.obs);
  RxList<RxBool> valorswparte3 = RxList.generate(16, (_) => true.obs);
  RxList<RxBool> valorswparte4 = RxList.generate(13, (_) => true.obs);
  RxList<RxBool> valorswparte5 = RxList.generate(16, (_) => true.obs);
  RxList<RxBool> valorswparte6 = RxList.generate(7, (_) => true.obs);

  //Lo de abajo ya no es necesario. Pero no se va a borrar hasta hacer unas pruebas
  /*void cambiarvalorparte3(bool valor, int i) {
    valorswparte3[i].value = valor;
  }

  void cambiarvalorparte4(bool valor, int i) {
    valorswparte4[i].value = valor;
  }*/
}
