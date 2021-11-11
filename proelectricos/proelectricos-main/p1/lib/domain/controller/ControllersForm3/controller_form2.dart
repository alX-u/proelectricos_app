import 'package:get/get.dart';

class ControllerForm2 extends GetxController {
  RxList<RxBool> valorswparte3 = RxList.generate(4, (_) => true.obs);
  RxList<RxBool> valorswparte4 = RxList.generate(7, (_) => true.obs);
  RxList<RxBool> valorswparte5 = RxList.generate(8, (_) => true.obs);
  RxList<RxBool> valorswparte6 = RxList.generate(3, (_) => true.obs);
  RxList<RxBool> valorswparte7 = RxList.generate(7, (_) => true.obs);
  RxList<RxBool> valorswparte8 = RxList.generate(2, (_) => true.obs);
  RxList<RxBool> valorswparte9 = RxList.generate(2, (_) => true.obs);
  RxList<RxBool> valorswparte10 = RxList.generate(5, (_) => false.obs);
  RxList<RxBool> valorswparte11 = RxList.generate(2, (_) => false.obs);
  RxList<RxBool> valorswparte12 = RxList.generate(5, (_) => false.obs);
  RxList<RxBool> valorswparte13 = RxList.generate(3, (_) => false.obs);

  /*class ControllerTablaForm1 extends GetxController {
  RxList<RxBool> si = RxList.generate(59, (_) => true.obs);
  RxList<RxBool> no = RxList.generate(59, (_) => false.obs);

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
 */
}
