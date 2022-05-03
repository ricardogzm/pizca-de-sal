import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/utils/validators.dart';
import 'package:pizca_de_sal/src/widgets/auth_related.dart';
import 'package:pizca_de_sal/src/widgets/text_between_lines.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LoginForm(),
            const SizedBox(height: 40),
            Column(children: [
              const TextBetweenLines(
                label: "o ingresa con",
                indent: 10,
                textStyle: TextStyle(fontSize: 16, color: Colors.black),
                lineColor: Colors.black,
              ),
              const SizedBox(height: 20),
              const SocialButtons(),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: '¿No tienes una cuenta? ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Regístrate',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 16, 185, 129),
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.of(context).pushNamed('/signup'),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _emailInput(),
          const SizedBox(height: 20),
          _passwordInput(),
          const SizedBox(height: 20),
          _loginSubmit(context),
        ],
      ),
    );
  }

  TextFormField _emailInput() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Correo',
      ),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: InputValidator.emailValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  TextFormField _passwordInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Contraseña',
        suffixIcon: Visibility(
          visible: _passwordController.text.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: FaIcon(
                _passwordVisible
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                size: 20,
              ),
              alignment: Alignment.center,
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
      ),
      controller: _passwordController,
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa una contraseña.';
        }

        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  ElevatedButton _loginSubmit(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login failed'),
              ),
            );
          }
        },
        child: const Text('Login'));
  }
}
