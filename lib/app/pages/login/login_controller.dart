import 'package:flutter/material.dart';

class LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLogged = ValueNotifier(false);

  String? validatePassword(String? value) {
    final String? commonErrorText = commonValidate(value);
    if (commonErrorText != null) return commonErrorText;

    if (value!.length < 2) {
      return 'O campo senha deve possuir no mínimo 2 carácteres.';
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'O campo senha não pode possuir caracteres especiais.';
    }

    return null;
  }

  String? commonValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (value.endsWith(' ')) {
      return 'O campo não pode terminar com espaço no final.';
    }
    return null;
  }

  Future<void> send() async {
    if (formKey.currentState!.validate()) {
      await Future.delayed(const Duration(milliseconds: 3000));
      isLogged.value = true;
    }
  }
}
