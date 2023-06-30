import 'package:flutter/material.dart';
import 'package:litehub/core/constants/constants.dart';
import 'package:litehub/model/LoginServices/login_services.dart';
import 'package:litehub/view/widgets/main_button.dart';
import 'package:litehub/view/widgets/main_text_field.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();
  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final loginServices = LoginServices();
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.app_registration_outlined,
                size: 60,
              ),
              kHeight20,
              MainTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              kHeight20,
              MainTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _pwdController,
              ),
              kHeight20,
              MainTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _confirmPwdController,
              ),
              kHeight30,
              MainButton(
                onTap: () {
                  loginServices.signUpUser(context, _emailController.text,
                      _pwdController.text, _confirmPwdController.text);
                },
                buttonText: 'Sign in',
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: const Text('Login now'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
