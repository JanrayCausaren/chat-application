import 'package:chat_application/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('jadkjfk');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 20),
                PasswordTextField(passwordController: _passwordController),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('Login')),
                Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();
    return TextFormField(
      controller: _passwordController,
      onChanged: (value) => auth.validatePassword(value),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: auth.passwordMessage.isNotEmpty
            ? auth.passwordMessage
            : null,
      ),
    );
  }
}
