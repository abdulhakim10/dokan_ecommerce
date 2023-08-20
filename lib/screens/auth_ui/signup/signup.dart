// ignore_for_file: use_build_context_synchronously

import 'package:dokan_ecommerce/constants/constants.dart';
import 'package:dokan_ecommerce/constants/routes.dart';
import 'package:dokan_ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:dokan_ecommerce/screens/home/home.dart';
import 'package:dokan_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:dokan_ecommerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  subtitle: 'Welcome back to Dokan', title: 'Create Account'),
              const SizedBox(height: 46),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(
                      Icons.person_outline,
                    )),
              ),
              const SizedBox(height: 12),
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
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Phone',
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                    )),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: 'Create Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
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
              const SizedBox(height: 12),
              PrimaryButton(
                  onPressed: () async {
                    bool isValidated = signUpValidation(
                        email.text, password.text, name.text, phone.text);
                    if (isValidated) {
                      bool isCreated = await FirebaseAuthHelper.instance
                          .signUp(email.text, password.text, context);
                      if (isCreated) {
                        Routes.instance.pushAndRemoveUntil(
                            widget: const Home(), context: context);
                      }
                    }
                  },
                  title: 'Sign Up'),
              const SizedBox(height: 24),
              const Center(child: Text("Already have an account?")),
              const SizedBox(height: 12),
              Center(
                child: CupertinoButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
