import 'package:flutter/material.dart';
import 'package:learn_english/operations/register_operations.dart';
import 'package:learn_english/widgets/register_scroll.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> userInformation = [
    "E-mail",
    "Şifre",
  ];

  late String _isim;

  late String _soyisim;

  late String _email;

  late String _password;

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
          Expanded(
            child: RegisterScroll(
              email: _email,
              name: _isim,
              password: _password,
              surname: _soyisim,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              RegisterOperations(
                _isim,
                _soyisim,
                _email,
                _password,
              ).registerWithEmailPassword(context);
            },
            child: const Text("Kayit ol"),
          ),
        ],
      ),
    );
  }
}

// ekleSirali(node *r, int eklenecekSayi){
//   if(r==null){
//     r=root;
//     r=(node*)malloc(sizeof(node*));
//     r->x=eklenecekSayi;
//   }else{
//     node* yeni=(node*)malloc(sizeof(node*));
//     yeni->x=eklenecekSayi;
//     // node*temp;
//     for(int i=0;i<5;i++){
//       if((r-> next ->x) < eklenecekSayi){
//         r=r->next;
//       }else{
//         yeni->next=r->next;
//         r->next=yeni;
//       }
      


  //   }
  // }

// }
