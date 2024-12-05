import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.business, // Replace with your desired icon
                    size: 120, // Adjust size as needed
                    color: Colors.blue, // Adjust color as needed
                  ),
                  Text(
                    'Company Name',
                    style: GoogleFonts.lato( // Replace with desired serif font
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Note: This is the default login page. Once you log in, this page will automatically update to reflect your company customized appearance for future logins.',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            // height: 1.5,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: _textEditingController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10),
                                  ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10),
                                  ),
                              ),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.blue,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              hintStyle:  TextStyle(color: Colors.black.withOpacity(0.5)),
                              labelStyle: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10),
                                    ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                ),
                                suffixIcon: IconButton( // Add the eye icon button
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText; // Toggle visibility
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '*********',
                                hintStyle:  TextStyle(color: Colors.black.withOpacity(0.5)),
                                labelStyle: const TextStyle(color: Colors.blue),
                              ),
                              validator: (value) {
                                if (value!.isEmpty && value!.length < 5) {
                                  return 'Enter a valid password';
                                  {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        isEmailCorrect
                            ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                backgroundColor: isEmailCorrect == false
                                    ? Colors.red
                                    : Colors.purple,
                                padding: const EdgeInsets.symmetric(horizontal: 131, vertical: 20)
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data'),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(fontSize: 17),
                            ))
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 3.3,
                              vertical: 20)
                          ),
                      onPressed: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17,
                            fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                  ), //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}