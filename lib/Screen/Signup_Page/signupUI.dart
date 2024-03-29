import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';

import '../../core/utils/image_constant.dart';
import '../../core/firebase_auth.dart';

class SignupUI extends StatefulWidget {
  const SignupUI({super.key});

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  String _headingText = 'Join the Community!';
  String errorMessage = 'Error';

  void _onSignupButtonPressed() {
    if (_validate()) {
      FirebaseAuthenticator()
          .signUp(context, _emailController, _passwordController);
    }
  }

  void _onLoginButtonPressed() {
    Navigator.pushNamed(context, '/login');
  }

  bool _validate() {
    return _form.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Text(
                _headingText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      onEditingComplete: _validate,
                      validator: ValidationBuilder()
                          .minLength(3)
                          .maxLength(50)
                          .build(),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      // onTapAlwaysCalled: _validate,
                      onEditingComplete: _validate,
                      validator:
                          ValidationBuilder().email().maxLength(50).build(),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      onEditingComplete: _validate,
                      validator: ValidationBuilder()
                          .minLength(8)
                          .maxLength(50)
                          .build(),
                      obscureText: true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: _onSignupButtonPressed,
                child: SizedBox(
                  width: 314,
                  height: 50,
                  child: Stack(
                    children: [
                      Container(
                        width: 314,
                        height: 50,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, -0.01),
                            end: Alignment(-1, 0.01),
                            colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 126,
                        top: 11,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.92,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // continue with text
              Row(
                children: [
                  //add a horizontal line
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xFFB5B5B5),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(0, 255, 255, 255),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              /**
               * Additional Login Options
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      // Google Login
                      InkWell(
                        onTap: () =>
                            FirebaseAuthenticator().googleAuth(context),
                        child: SizedBox(
                          width: 58.10,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgCard),
                                      fit: BoxFit.none,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    // image: DecorationImage(
                                    //   image: ImageIcon(image: AssetImage(ImageConstant.imgCard)).image,
                                    //   fit: BoxFit.none,
                                    // ),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(ImageConstant.imgGoogle),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.30, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.85),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Facebook Login
                      InkWell(
                        onTap: () {
                          setState(() {
                            _headingText = "Facebook? Really? ";
                          });
                        },
                        child: SizedBox(
                          width: 58.10,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgCard),
                                      fit: BoxFit.none,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                    width: 58.10,
                                    height: 44,
                                    decoration: ShapeDecoration(
                                      // image: DecorationImage(
                                      //   image: ImageIcon(image: AssetImage(ImageConstant.imgCard)).image,
                                      //   fit: BoxFit.none,
                                      // ),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.30, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.85),
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        ImageConstant.imgFacebook,
                                        color: Colors.blue,
                                        width: 30,
                                        height: 30,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 44,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _onLoginButtonPressed,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 15,
                        bottom: 15,
                      ),
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(1.00, -0.01),
                          end: Alignment(-1, 0.01),
                          colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        ' Login Instead ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
