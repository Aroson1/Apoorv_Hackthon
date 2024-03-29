import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:flutter/material.dart';

import 'loginUI.dart';
import '../../core/app_export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Stack(
          children: <Widget>[
            /**
             * Circluar glow at the bottom right of the screen
             */
            Positioned(
              bottom: -200,
              right: -120,
              child: Container(
                width: 447,
                height: 803,
                decoration: ShapeDecoration(
                  gradient: const RadialGradient(
                    center: Alignment(0.41, 0.48),
                    radius: 0.48,
                    colors: [
                      Color(0xFFD779DF),
                      Color(0x0036005F),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(59),
                  ),
                ),
              ),
            ),
            /**
             * Circluar glow at the top right of the screen
             */
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    Color.fromARGB(255, 128, 54, 255),
                    Color.fromARGB(0, 255, 0, 242),
                  ], stops: [
                    0,
                    1
                  ]),
                ),
                child: const SizedBox(),
              ),
            ),
            /**
             * Circluar glow at the bottom left of the screen
             */
            Positioned(
              bottom: -150,
              left: -150,
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    Color.fromARGB(255, 196, 86, 71),
                    Color.fromARGB(0, 196, 86, 71),
                  ], stops: [
                    0,
                    1
                  ]),
                ),
                child: const SizedBox(),
              ),
            ),

            /**
             * Main Content
             */
            Column(
              children: [
                /**
                 * Image on the top of the container
                 */
                Image.asset(
                  ImageConstant.imgIllustration,
                  fit: BoxFit.cover,
                ),
                /**
                 * Glassmorphic container
                 */
                Expanded(
                  child: GlassContainer(
                    width: double.infinity,
                    height: double.infinity,
                    blur: 50,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      // topRight: Radius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        /**
                         * Slight glow on the left side of the container
                         */
                        Positioned(
                          left: -10,
                          top: 0,
                          child: Container(
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    ImageConstant.imgFrontShapes109x129),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        /**
                         * Cubes on the rigth side of the contianer
                         */
                        Positioned(
                          right: 0,
                          top: 100,
                          child: Container(
                            width: 60,
                            height: 85,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    ImageConstant.imgFrontShapes97x92),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 50,
                          child: Container(
                            width: 97,
                            height: 92,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    ImageConstant.imgFrontShapes60x85),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        /**
                         * Login UI
                         */
                        const SingleChildScrollView(child: LoginUI())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
