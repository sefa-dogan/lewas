import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatelessWidget {
  Register({super.key});
  List<String> userInformation = [
    "Ad",
    "Soyad",
    "Doğum tarihi",
    "E-mail",
    "Şifre",
    "Şifreyi tekrar giriniz",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("LEWAS",
                  style: TextStyle(
                    fontSize: 24,
                  ))),
          bottom: PreferredSize(
              child: Text(
                "Learn English Words And Speak",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
              preferredSize: Size(10, 10)),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(child: bilgiIsteyenMetod()),
            ElevatedButton(onPressed: () {}, child: Text("Kayıt ol"))
          ],
        ));
  }

  /* ListView denemeListView() {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            child: Row(
              children: [
                userInformation
                    .map(
                      (e) => Row(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: e,
                                labelText: e),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  } */

  ListView klasikListView() {
    return ListView(
        scrollDirection: Axis.vertical,
        children: userInformation
            .map((e) => Row(
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: e,
                              labelText: e),
                        ),
                      ],
                    ),
                  ],
                ))
            .toList()
        // ElevatedButton(onPressed: () {}, child: Text("Kayıt ol"))

        );
  }

  ListView klasikListView2() {
    return ListView(scrollDirection: Axis.vertical, children: [
      ElevatedButton(onPressed: () {}, child: Text("fds")),
      Text("data"),
      Row(
        children: [Container()],
      ),
      Container()
    ]);
  }

  Widget bilgiIsteyenMetod() {
    return ListView.builder(
      itemBuilder: (context, index) {
        String userInfo = userInformation[index];
        return Padding(
          padding: EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: userInfo,
              labelText: userInfo,
              border: OutlineInputBorder(),
            ),
            autofocus: index == 0 ? true : false,
          ),
        );
      },
      itemCount: userInformation.length,
    );
  }
}
