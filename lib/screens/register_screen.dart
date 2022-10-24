import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/model/mobx/register_info.dart';
import 'package:learn_english/operations/register_operations.dart';
import 'package:learn_english/widgets/register_scroll.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

String sefa = "";

class _RegisterState extends State<Register> {
  final locatorRegisterInfo = locator<RegisterInfo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "LEWAS",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 18,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Expanded(
            child: RegisterScroll(),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await RegisterOperations(
                  locatorRegisterInfo.name,
                  locatorRegisterInfo.surname,
                  locatorRegisterInfo.email,
                  locatorRegisterInfo.password,
                ).registerWithEmailPassword(context);
                Get.offAllNamed("loginpage");
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text("Kayıt oluşturulamadı"),
                    );
                  },
                );
              }
            },
            child: const Text("Kayit ol"),
          ),
        ],
      ),
    );
  }
}
