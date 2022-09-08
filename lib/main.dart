import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start/user_controller.dart';

void main() {

  //Get.put<UserController>(UserController()); // INJEÇÃO DE MEMORIA

  Get.lazyPut<UserController>(()=> UserController()); // MAIS EFICIENTE
                                                      // SO INJETA NA MEMORIA APOS O OBJETO
                                                      // SER INSTANCIADO EM ALGUM LUGAR DA APLICAÇÃO

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage3(),
    );
  }
}


//teste01
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  TextStyle commonStyle() => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => Text(
                'Nome: ${userController.user.value.name}',
                style: commonStyle(),
              ),
            ),
            Obx(
              () => Text(
                'idade: ${userController.user.value.age}',
                style: commonStyle(),
              ),
            ),

            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),

                // Botão para salvar o nome
                ElevatedButton(
                  onPressed: () {

                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                    ),
                  ),
                ),

                // Botão para salvar a idade
                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

//teste02
class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  final UserController userController = Get.find(); //Procura na memoria do dispositivo se algum objeto do tipo "UserController" foi instanciado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),

                // Botão para salvar o nome
                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                    ),
                  ),
                ),

                // Botão para salvar a idade
                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DataScreen();
                    },
                  ),
                );
              },
              child: const Text('Tela de dados'),
            ),
          ],
        ),
      ),
    );
  }
}


//tela de dados teste02
class DataScreen extends GetView<UserController> {

 //final UserController controller = Get.find();

   DataScreen({
    Key? key,
  }) : super(key: key);

  TextStyle commonStyle() => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Apresentação do nome
            Obx(
              () => Text(
                'Nome: ${controller.user.value.name}',
                style: commonStyle(),
              ),
            ),

            // Apresentação da idade
            Obx(
              () => Text(
                'idade: ${controller.user.value.age}',
                style: commonStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//teste03 navegação com GetX
class HomePage3 extends StatelessWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                // Apresentação de valor
                child: Text(
                  'Valor: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Botão para navegação
            ElevatedButton(
              onPressed: () async {
                // final result = await Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return DataScreen2();
                //     },
                //   ),
                // );

                // Navigator.of(context).pushNamed("/signin");
                // Get.toNamed("/signin");


                //final result = await Get.to(DataScreen2()); // Navegação com GetX
                final result = await Get.to(() => DataScreen2()); // Mais performatico
                print(result);
              },
              child: const Text('Segunda tela'),
            ),
          ],
        ),
      ),
    );
  }
}


//tela de dados teste 03
class DataScreen2 extends StatelessWidget {
  DataScreen2({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definição de dado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de definição de valor
            TextField(
              controller: textController,
            ),

            // Espaçamento
            const SizedBox(height: 10),

            // Botão para voltar passando o valor
            ElevatedButton(
              onPressed: () {

                final value = textController.text;

                 // Navigator.of(context).pop(value);
                 Get.back(result: value);
              },
              child: const Text('Retornar'),
            ),
          ],
        ),
      ),
    );
  }
}