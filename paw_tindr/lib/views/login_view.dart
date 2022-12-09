import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paw_tindr/firebase_options.dart';
import 'package:paw_tindr/views/home_view.dart';
import 'package:paw_tindr/views/register_view.dart';

import '../models/owner.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}
// Login to the system

class _LoginViewState extends State<LoginView> {
  static Future<User?> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found with that email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // Controllers for text email and password
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/header_logo.png'),
                  width: 400.0,
                  height: 100.0,
                  fit: BoxFit.scaleDown,
                  alignment: FractionalOffset.topCenter,
                ),
                const Text("Login to your App",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 44.0),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register here.",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 88.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: const Color(0xFF0069FE),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () async {
                      // Sign user in to firebase
                      User? user = await loginWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                      Owner owner;
                      print(await FirebaseFirestore.instance
                          .collection("Owners")
                          .doc(user?.uid)
                          .get());
                      owner = Owner.fromSnapshot((await FirebaseFirestore
                          .instance
                          .collection("Owners")
                          .where('id', isEqualTo: user?.uid)
                          .get()) as DocumentSnapshot<Object?>);
                      if (FirebaseAuth.instance.currentUser != null) {
                        final ref = FirebaseFirestore.instance
                            .collection("Owners")
                            .doc(user?.uid)
                            .withConverter(
                              fromFirestore: Owner.fromFirestore,
                              toFirestore: (Owner owner, _) =>
                                  owner.toFirestore(),
                            );

                        final docsnap = await ref.get();
                        final owner = docsnap.data;
                        if (owner != null)
                          print(owner);
                        else
                          print('no such doc');

                        // const source = Source.cache;
                        // ref.get(const GetOptions(source: source)).then((value) => null)
                        // .withConverter(
                        //   fromFirestore: Owner.fromFirestore,
                        //   toFirestore: (Owner owner, _) =>
                        //       owner.toFirestore(),
                        // );
                        // final Owner owner =
                        // DocumentReference ownersref =
                        //     owners.where('id', isEqualTo: user!.uid);

                        // await ownersref.get().then((snapshot) {
                        //   snapshot.docs.forEach((document) {
                        //     print(document.data()['id']);
                        //   });
                        // });

                        // print(user!.uid);
                        // print(user.providerData);
                        // var test = await owners
                        //     .doc(FirebaseAuth.instance.currentUser!.uid);

                        // owners
                        //     .doc(FirebaseAuth.instance.currentUser!.uid)
                        //     .get()
                        //     .then((s) => print(s.toString()));

                        // if (owner != null) {
                        //   print(owner.firstName);
                        // } else {
                        //   print("No such document.");
                        // }
                      }

                      if (user?.uid == owner!.id) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeView(owner),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
