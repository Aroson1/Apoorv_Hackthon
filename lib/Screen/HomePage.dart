// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import '../widgets/modal/popover.dart';
import '../Screen/MainScreenTiles/main_screen_tiles.dart';

enum MainScreenTiles {
  bitcoin,
  phoneno,
  upi,
  sms,
  url,
}

class GlassmorphicGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void openSMS() {}
    void handleFABPressed(Enum selectedTile) {
      showModalBottomSheet<int>(
        isScrollControlled: true,
        backgroundColor: Color.fromARGB(80, 255, 255, 255),
        barrierColor: Color.fromARGB(165, 0, 0, 0),
        context: context,
        builder: (context) {
          return Popover(
            child: Column(
              children: [
                if (selectedTile == MainScreenTiles.sms) SMSList(),
                if (selectedTile == MainScreenTiles.bitcoin) BitcoinAddress(),
                if (selectedTile == MainScreenTiles.phoneno)
                  PhoneNoVerification(),
                if (selectedTile == MainScreenTiles.url) URLVerification(),
                if (selectedTile == MainScreenTiles.upi) UPIVerification(),
              ],
            ),
          );
        },
      );
    }

    const double gridCellHeight = 100;
    return Stack(
      children: [
        /**
             * Circluar glow at the bottom right of the screen
             */
        Positioned(
          bottom: 100,
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
        Positioned(
          top: -120,
          left: -100,
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                'Welcome to your Cyber Gardian!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 25,
                  top: 5,
                ),
                child:
                    Text('Here are some tools to help you stay safe online')),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (3 / 2.4),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                padding: EdgeInsets.all(16.0),
                children: [
                  GlassContainer(
                    blur: 50,
                    height: gridCellHeight,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        handleFABPressed(MainScreenTiles.sms);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'View Flagged SMS',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlassContainer(
                    blur: 50,
                    height: gridCellHeight,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        handleFABPressed(MainScreenTiles.phoneno);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Check Phone No.',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlassContainer(
                    blur: 50,
                    height: gridCellHeight,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        handleFABPressed(MainScreenTiles.bitcoin);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Bitcoin Address',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlassContainer(
                    blur: 50,
                    height: gridCellHeight,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        handleFABPressed(MainScreenTiles.url);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'URL Verificaiton',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlassContainer(
                    blur: 50,
                    height: gridCellHeight,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(216, 121, 223, 0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        handleFABPressed(MainScreenTiles.upi);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'UPI Verification',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildListItem(
  //   BuildContext context, {
  //   Widget? title,
  //   Widget? leading,
  //   Widget? trailing,
  // }) {
  //   final theme = Theme.of(context);

  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 24.0,
  //       vertical: 16.0,
  //     ),
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           color: theme.dividerColor,
  //           width: 0.5,
  //         ),
  //       ),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         if (leading != null) leading,
  //         if (title != null)
  //           Padding(
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: 16.0,
  //             ),
  //             child: DefaultTextStyle(
  //               child: title,
  //               style: theme.textTheme.titleLarge!,
  //             ),
  //           ),
  //         Spacer(),
  //         if (trailing != null) trailing,
  //       ],
  //     ),
  //   );
  // }
}
