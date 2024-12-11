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
  final Color iconColor = const Color(0xFF0667a3);
  final Color buttonColor = const Color(0xFF0575ba);
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/company_logo.png', // Path to your image asset
                  height: 180, // Adjust height as needed
                  width: 180, // Adjust width as needed
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Welcome! to\n'),
                        TextSpan(
                          text: 'Fleet Trek',
                          style: TextStyle(color: buttonColor), // Blue color for Fleet Trek
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: iconColor, width: 2),
                                borderRadius: const BorderRadius.all(Radius.circular(30),
                                ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(30),
                                ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: iconColor,
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.25),
                            labelText: "Email",
                            hintText: 'your-email@domain.com',
                            hintStyle:  TextStyle(color: Colors.black.withOpacity(0.5)),
                            labelStyle: TextStyle(color: iconColor),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: iconColor, width: 2),
                                  borderRadius: const BorderRadius.all(Radius.circular(30),
                                  ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: iconColor,
                              ),
                              suffixIcon: IconButton( // Add the eye icon button
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off : Icons.visibility,
                                  color: iconColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText; // Toggle visibility
                                  });
                                },
                              ),
                              filled: true,
                                fillColor: Colors.grey.withOpacity(0.25),
                              labelText: "Password",
                              hintText: '*********',
                              hintStyle:  TextStyle(color: Colors.black.withOpacity(0.5)),
                              labelStyle: TextStyle(color: iconColor),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: buttonColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3.3,
                            vertical: 20)
                        ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();

                        if (!isEmail(_textEditingController.text)) { // Check email format
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Incorrect email format')),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ), //
              ],
            ),
          ),
        ),
      ),
    );
  }
}