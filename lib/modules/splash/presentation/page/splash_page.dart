import 'package:flutter/material.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController control = SplashController();

  @override
  void initState() {
    super.initState();
    control.goToPokedexPage(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEC0344),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_home.png'),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('ioasys pokédex',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ],
          ),
        ),
      );
}
