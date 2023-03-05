import 'package:flutter/material.dart';
import 'package:kykey/app/widgets/cards/kykey_password_card.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas senhas'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Buscar senha',
                suffixIcon: GestureDetector(onTap: () {debugPrint('search');}, child: const Icon(Icons.search)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: index == 99 ? 32 : 6,
                      top: index == 0 ? 12 : 0,
                      left: 24,
                      right: 24),
                  child: const KykeyPasswordCard(
                    title: 'Gmail',
                    login: 'ytaveiros@gmail.com',
                    password: 'UmA.SeNhA.MuItO.GrAnDe.123.456.798',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
