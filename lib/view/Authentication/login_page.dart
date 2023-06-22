import 'package:flutter/material.dart';
import 'package:litehub/core/constants/constants.dart';
import 'package:litehub/model/LoginServices/login_services.dart';
import 'package:litehub/view/widgets/main_button.dart';
import 'package:litehub/view/widgets/main_text_field.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap,
  });
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                color: Colors.blue[800],
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
              kHeight30,
              MainButton(
                onTap: () {
                  LoginServices().loginUser(
                    context,
                    _emailController.text,
                    _pwdController.text,
                  );
                },
                buttonText: 'Sign in',
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not Registered ?'),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: const Text('Register now'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
