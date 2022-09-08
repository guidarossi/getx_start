import 'package:get/get.dart';

class ValueController extends GetxController {

//Toda variavel observavel deve ser inicializada com algum valor
  RxString definedValue = '' .obs; //variavel observavel

  RxBool isLoading = false .obs; //variavel observavel

  Future<void> setValue(String newValue) async{

    isLoading.value = true;


    //atraso de 2segundos para efetuar a ação
    await Future.delayed(const Duration(seconds: 2),);

    definedValue.value = newValue;
    isLoading.value = false;

  }
}