import 'package:boost_ballistics/providers/states/login_controller.dart';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/states/login_states.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
    }));

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Boost Ballistics',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 20),
            )),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //forgot password screen
          },
          child: const Text(
            'Forgot Password',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Does not have account?'),
            TextButton(
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              //signup screen
            ),
          ],
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              ref
                  .read(loginControllerProvider.notifier)
                  .login(emailController.text, passwordController.text);
            },
          ),
        ),
      ]),
    ));
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
