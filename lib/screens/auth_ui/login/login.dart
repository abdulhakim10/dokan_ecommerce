import 'package:dokan_ecommerce/constants/routes.dart';
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
              decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  )),
            ),
            const SizedBox(height: 12),
            TextFormField(
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
            PrimaryButton(onPressed: () {}, title: 'Login'),
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
