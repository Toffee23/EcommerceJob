import 'package:ecommerce/controller.dart';
import 'package:ecommerce/widgets/fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child:
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
                Icons.phone_android,
                size: 100,
            ),
            const SizedBox(height: 75),
            // Hello again!
            Text(
                'Hello Again!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 20,
                ),
            ),
            const SizedBox(height: 50),

            // email textfield

            const LoginField(
              hintText: 'Email'
            ),
            const LoginField(
              hintText: 'Password'
            ),

            const SizedBox(height: 15.0),

            ElevatedButton(
                onPressed: () => controller.onLogin(context),
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(
                  Size(double.infinity, 42.0)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                )
              ),
              child: const Text('Sign In'),
            ),

            // sign in button
            const SizedBox(height: 25),
            // not a member? register now
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => controller.onRegisterNow(context),
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
            ),
          ]),
              ),
        ),
      ),
    );
  }
}
