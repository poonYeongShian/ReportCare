import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Booleans to change the display of UI elements.
  bool showPassword = false;
  bool englishSelected = true;

  //Text controllers to obtain values from form fields.
  var userController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Size.fromHeight(duSetHeight(42))
                  : Size.fromHeight(duSetHeight(96)),
          child: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('ReportCare',
                  style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontFamily: "Righteous",
                      fontWeight: FontWeight.normal,
                      fontSize: 24)),
              centerTitle: true),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: [
            //Sign In Title
            const SizedBox(height: 30),
            const Text('Sign In',
                textScaleFactor: 2.5,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            //Logo
            Image.asset(
              'assets/images/heart-icon.png',
              scale: 0.6,
            ),
            const SizedBox(height: 30),
            //Creating the form fields.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                child: Column(
                  children: [
                    //User or Email Field
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: userController,
                      decoration: const InputDecoration(
                          labelText: 'Username or Email',
                          prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30),
                    //Password Field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText:
                          !showPassword, //Decides whether the password should be shown.
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          //Change icons based on whether password is displayed or not.
                          suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Forgot Password Button
            Row(
              children: [
                const SizedBox(width: 35),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/forgot",
                    );
                  },
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
            //Sign In Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 105),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 52,
                //Checks if the user field contains an email or username and performs different functions accordingly.
                onPressed: () async {
                  if (userController.text.contains('@')) {
                    await FirebaseUtil().signInEmail(
                        userController.text, passwordController.text);
                  } else {
                    await FirebaseUtil().signInUsername(
                        userController.text, passwordController.text);
                  }
                  //Opens Home Page after signing in. TO DO: Implementation is slow at the moment. Try to find a solution.
                  bool isUserLogin = await FirebaseUtil().isUserLogin();

                  if (isUserLogin) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/app',
                      (route) => false,
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                color: const Color.fromRGBO(55, 190, 125, 1.0),
                textColor: AppColors.primaryElementText,
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            //Sign Up Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/sign_up",
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            //Language Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      englishSelected = true;
                    });
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('English',
                      //Font weight is changed based on the selected language.
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: englishSelected
                              ? FontWeight.bold
                              : FontWeight.normal)),
                ),
                const SizedBox(width: 90),
                TextButton(
                  onPressed: () {
                    setState(() {
                      englishSelected = false;
                    });
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('Bahasa Melayu',
                      //Font weight is changed based on the selected language.
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: englishSelected
                              ? FontWeight.normal
                              : FontWeight.bold)),
                ),
              ],
            )
          ]),
        )));
  }
}
