import 'package:dokan_ecommerce/constants/assets_images.dart';
import 'package:dokan_ecommerce/widgets/primary_button.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight + 12,
            ),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Buy any item for using app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
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
            PrimaryButton(onPressed: () {}, title: 'Login'),
            const SizedBox(height: 18),
            PrimaryButton(onPressed: () {}, title: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
