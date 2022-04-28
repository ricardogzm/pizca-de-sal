import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
    ]);
  }
}

class ExistentAccountText extends StatelessWidget {
  const ExistentAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '¿Ya tienes una cuenta? ',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: 'Ingresa aquí.',
            style: const TextStyle(
                color: Color.fromARGB(255, 16, 185, 129),
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(context).pushNamed('/login'),
          ),
        ],
      ),
    );
  }
}
