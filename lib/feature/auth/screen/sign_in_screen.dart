

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costant/custom_color.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_text_tield.dart';

class SignInScreen extends StatefulWidget {
  final Function(bool) onToggle;
  const SignInScreen({super.key, required this.onToggle});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    } else {
      print('Sign In Successful!');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Welcome!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),

          CustomContainer(
            height: 150,
            backgroundColor: Colors.transparent,
            margin: EdgeInsets.all(0),
            child: Image.asset('assets/auth/signinImg.png', color: CustomColor.appColor.withOpacity(0.3),),
          ),
          SizedBox(height: 50),

          CustomTextField(
            controller: _phoneController,
            labelText: 'Email/Phone *',
            hintText: 'Enter email or phone number',
            icon: null,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 12),

          CustomTextField(
            controller: _passwordController,
            labelText: 'Password *',
            hintText: 'Enter your password',
            icon: null,
            obscureText: _obscurePassword,
          ),


          /// Show/Hide Password Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.check_box_outline_blank
                      : Icons.check_box_outlined,
                ),
                label: Text(
                  _obscurePassword ? 'Show Password' : 'Hide Password',
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),

          CustomButton(
            text:  'Sign In',
            onTap: _signIn,
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Forgot Password')),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: CustomColor.appColor),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  widget.onToggle(true); // Go to SignUpScreen
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
