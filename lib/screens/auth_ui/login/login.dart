// ignore_for_file: use_build_context_synchronously
import 'package:dokan_ecommerce/constants/constants.dart';
import 'package:dokan_ecommerce/constants/routes.dart';
import 'package:dokan_ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:dokan_ecommerce/screens/home/home.dart';
import 'package:dokan_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:dokan_ecommerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                subtitle: 'Welcome back to E-Commerce app', title: 'Login'),
            const SizedBox(height: 46),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  )),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: password,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(
                  Icons.password_sharp,
                ),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: isShowPassword == true
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: 36),
            PrimaryButton(
                onPressed: () async {
                  bool isValidated = loginVaildation(email.text, password.text);
                  if (isValidated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const Home(), context: context);
                    }
                  }
                },
                title: 'Login'),
            const SizedBox(height: 24),
            const Center(child: Text("Don't have an account?")),
            const SizedBox(height: 12),
            Center(
              child: CupertinoButton(
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Routes.instance.pushAndRemoveUntil(
                        widget: const Home(), context: context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
