import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StateMachineController? controller;
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandingsUp;
  SMIInput<bool>? trigsuccess;
  SMIInput<bool>? trigFail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xffD6E2EA),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 200,
                    child: Expanded(
                        child: RiveAnimation.asset(
                      "images/animated_login_character.riv",
                      stateMachines: ["Login Machine"],
                      onInit: (artboard) {
                        controller = StateMachineController.fromArtboard(
                            artboard, "Login Machine");
                        if (controller == null) return;
                        artboard.addController(controller!);
                        isChecking = controller?.findInput("isChecking");
                        isHandingsUp = controller?.findInput("isHandingsup");
                        trigsuccess = controller?.findInput("trigsuccess");
                        trigFail = controller?.findInput("trigFail");
                      },
                    ))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    if (isHandingsUp != null) {
                      isHandingsUp!.change(false);
                    }
                    if (isChecking == null) return;
                    isChecking!.change(true);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "E mail",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    if (isChecking != null) {
                      isChecking!.change(false);
                    }
                    if (isHandingsUp == null) return;
                    isHandingsUp!.change(true);
                  },
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                  child: const Text(
                    "Forgot your password?",
                    textAlign: TextAlign.left,
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.purple,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minWidth: 400,
                  height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't you have accaunt?"),
                    TextButton(onPressed: () {}, child: const Text("Register"))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
