class InputValidator {
  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Por favor, ingrese un nombre.';
    }

    final nameRegex = RegExp(r"^([a-zA-Z\xC0-\uFFFF]{1,60}[ \-\']{0,1}){1,3}$");

    if (!nameRegex.hasMatch(name)) {
      return 'Por favor, ingrese un nombre válido.';
    }

    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Por favor, ingrese un correo electrónico.';
    }

    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!emailRegex.hasMatch(email)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Por favor, ingrese una contraseña.';
    }

    final passwordRegex =
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$");

    if (!passwordRegex.hasMatch(password)) {
      return 'Una contraseña válida debe contener al menos 8 caracteres, un carácter especial y un número.';
    }

    return null;
  }
}
