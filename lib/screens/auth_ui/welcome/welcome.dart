import 'package:dokan_ecommerce/constants/assets_images.dart';
import 'package:dokan_ecommerce/constants/routes.dart';
import 'package:dokan_ecommerce/screens/auth_ui/login/login.dart';
import 'package:dokan_ecommerce/screens/auth_ui/signup/signup.dart';
import 'package:dokan_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:dokan_ecommerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                subtitle: 'Buy any item from using app', title: 'Welcome'),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.facebook,
                      size: 39,
                      color: Colors.blue,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Padding(
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        AssetsImages.instance.googleLogo,
                        scale: 48,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 18),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
                },
                title: 'Login'),
            const SizedBox(height: 18),
            PrimaryButton(
                onPressed: () {
                  Routes.instance
                      .push(widget: const SignUp(), context: context);
                },
                title: 'Create Account')
          ],
        ),
      ),
    );
  }
}
