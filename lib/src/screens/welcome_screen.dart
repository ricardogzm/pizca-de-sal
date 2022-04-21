import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/widgets/text_between_lines.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 0.9),
            colors: [
              Color.fromARGB(29, 177, 180, 192),
              Color.fromARGB(255, 25, 27, 47),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 120.0, left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _hero(),
                ),
                _loginOptions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _hero() {
    return const [
      Text.rich(
        TextSpan(
          text: 'Bienvenido a ',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'PIZCA DE SAL',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 16, 185, 129),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'Cocinar nunca fue tan fácil.',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF30384F),
        ),
      ),
    ];
  }

  Column _loginOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextBetweenLines(
          label: "Ingresa con",
          indent: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.green,
              ),
              label: const Text("GOOGLE"),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
              label: const Text("FACEBOOK"),
            ),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pushNamed('/signup'),
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromARGB(50, 255, 255, 255),
            primary: Colors.white,
            side: const BorderSide(color: Colors.white, width: 0.7),
            textStyle: Theme.of(context).textTheme.button?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
          ),
          child: const Text("Usar número de teléfono o correo"),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text.rich(
            TextSpan(
              text: '¿Ya tienes una cuenta? ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: 'Ingresa aquí.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 16, 185, 129),
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
