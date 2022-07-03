import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Gilroy',
          textTheme: const TextTheme(button: TextStyle(fontFamily: 'Gilroy')),
          snackBarTheme: const SnackBarThemeData(
              contentTextStyle: TextStyle(fontFamily: 'Gilroy'))),
      home: const MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text('Custom SnackBar'),
      ),
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      body: Center(
        child: TextButton(
          onPressed: () {
            // customSnackBar(
            //     'Oh, Snap', 'Error in the server.', const Color(0xFF801336));
            // customSnackBar('Success', 'Your account in successfully created.',
            //     const Color(0xFF177302));
            customSnackBar('Do you know?', 'How we can create this account.',
                const Color(0xFF024A91));
          },
          // ignore: sort_child_properties_last
          child: const Text('Custom SnackBar'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        ),
      ),
    );
  }

  void customSnackBar(String title, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(milliseconds: 2000),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: const EdgeInsets.all(16.0),
              height: 90,
              decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          message,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
              right: 5,
              top: -12,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(20.0)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ))
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
