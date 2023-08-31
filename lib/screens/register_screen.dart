import 'package:flutter/material.dart';
import 'package:pokedex_mobile/services/snackbar_service.dart';
import 'package:pokedex_mobile/widgets/form_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double deviceHeight = 0;
  double deviceWidth = 0;

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 63, 71),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                header(),
                const FormEmailPassword(mode: "Registrarse"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/5.jpg",
            height: deviceWidth * 0.60,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "POKEDEX",
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 85,
        ),
        const Text(
          "REGISTRARSE",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
