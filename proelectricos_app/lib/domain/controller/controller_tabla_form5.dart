import 'package:get/get.dart';

class ControllerTablaForm2 extends GetxController {
  RxList<RxBool> si = RxList.generate(61, (_) => true.obs);
  RxList<RxBool> no = RxList.generate(61, (_) => false.obs);

  void cambiarvalorsi(bool valor, int i) {
    si[i].value = valor;
    if (si[i].value) {
      no[i].value = !si[i].value;
    }
  }

  void cambiarvalorno(bool valor, int i) {
    no[i].value = valor;
    if (no[i].value) {
      si[i].value = !no[i].value;
    }
  }
}
