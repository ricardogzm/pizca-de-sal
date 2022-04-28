import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/utils/validators.dart';
import 'package:pizca_de_sal/src/widgets/auth_related.dart';
import 'package:pizca_de_sal/src/widgets/text_between_lines.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SignupForm(),
            const SizedBox(height: 40),
            Column(children: [
              Text.rich(
                TextSpan(
                  text: '¿Ya tienes una cuenta? ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Ingresa aquí.',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 16, 185, 129),
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.of(context).pushNamed('/login'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const TextBetweenLines(
                label: "o ingresar con",
                indent: 20,
                textStyle: TextStyle(fontSize: 16, color: Colors.black),
                lineColor: Colors.black,
              ),
              const SizedBox(height: 20),
              const SocialButtons(),
            ])
          ],
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final double _separation = 30;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Nombre completo",
          ),
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
          validator: InputValidator.nameValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
        ),
        SizedBox(height: _separation),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Correo electrónico",
          ),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          validator: InputValidator.emailValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(height: _separation),
        passwordInput(),
        SizedBox(height: _separation),
        confirmPasswordInput(),
        SizedBox(height: _separation),
        ElevatedButton(
          child: const Text("Registrarse"),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Registro exitoso")),
              );
              // Navigator.of(context).pushNamed('/');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Error en el registro")),
              );
            }
          },
        ),
      ]),
    );
  }

  TextFormField passwordInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Contraseña",
        errorMaxLines: 2,
        suffixIcon: Padding(
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
      obscureText: !_passwordVisible,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      validator: InputValidator.passwordValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: passwordController,
    );
  }

  TextFormField confirmPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirmar contraseña",
        // Add a suffix icon to the password field
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            icon: FaIcon(
              _confirmPasswordVisible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              size: 20,
            ),
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            },
          ),
        ),
      ),
      obscureText: !_confirmPasswordVisible,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Confirme su contraseña";
        }

        if (value != passwordController.text) {
          return "Las contraseñas no coinciden.";
        }

        return null;
      },
    );
  }
}
