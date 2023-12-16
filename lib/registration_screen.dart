// registration_screen.dart
import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'user.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // ... (existing code)

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    User user = User(
                      null,
                      _usernameController.text,
                      _passwordController.text,
                      _phoneController.text,
                      _emailController.text,
                      _addressController.text,
                    );

                    DBHelper dbHelper = DBHelper();
                    await dbHelper.saveUser(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User data saved')));
                    Navigator.pushReplacementNamed(context, '/main');
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
