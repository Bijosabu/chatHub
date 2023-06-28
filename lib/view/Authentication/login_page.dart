// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:litehub/core/constants/constants.dart';
import 'package:litehub/model/LoginServices/login_services.dart';
import 'package:litehub/view/widgets/main_button.dart';
import 'package:litehub/view/widgets/main_text_field.dart';
import 'package:connectivity/connectivity.dart';

final _loginServices = LoginServices();

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap,
  });
  final _loginServices = LoginServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signIn(BuildContext context) async {
      final currentContext = context;
      try {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          _loginServices.loginUser(
              currentContext, _emailController.text, _pwdController.text);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No internet connection')));
        }
      } on Exception catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

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
                  signIn(context);
                  // _emailController.dispose();
                  // _pwdController.dispose();
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
