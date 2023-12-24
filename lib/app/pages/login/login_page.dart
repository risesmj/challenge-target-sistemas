import 'package:challenge_target_sistemas/app/core/widgets/button_loading.dart';
import 'package:challenge_target_sistemas/app/core/widgets/scaffold_default.dart';
import 'package:challenge_target_sistemas/app/pages/list_text/list_text_page.dart';
import 'package:challenge_target_sistemas/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();

    controller = LoginController();

    controller.isLogged.addListener(() {
      if (controller.isLogged.value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ListTextPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller.isLogged.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _textFormField(
              label: 'Usuário',
              icon: Icons.account_circle,
              validator: controller.commonValidate,
            ),
            const SizedBox(
              height: 16,
            ),
            _textFormField(
              label: 'Senha',
              icon: Icons.lock,
              validator: controller.validatePassword,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonLoading(
              onPressed: controller.send,
              label: 'Entrar',
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField({
    String? label,
    IconData? icon,
    String? Function(String?)? validator,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              label ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          TextFormField(
            validator: validator,
            textInputAction: TextInputAction.next,
            maxLength: 20,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIconColor: const Color(0xFF202937),
              prefixIcon: Icon(
                icon,
              ),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ],
      );
}
