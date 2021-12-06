import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notificacao/app/shared/colors.dart';
import 'package:notificacao/app/shared/dimensions.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:notificacao/meta/views/auth/signup_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox3,
            // vSizedBox2,
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(EvaIcons.arrowIosBackOutline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            vSizedBox4,
            Container(
              //AJUSTE NECESSARIO
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                //TEXT INICIAL
                children: [
                  Text(
                    "Bem vindo de volta!",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: whiteColor),
                  ),
                  Text(
                    "Confira as novas tendencias",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                  Text(
                    "Ofertas somente para voce",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                ],
              ),
            ),
            
            vSizedBox3,
            vSizedBox1,
            //FORMULARIO
            Container(
              child: Column(
                children: [
                  vSizedBox1,
                  stylishTextField("Email", emailController),
                  vSizedBox1,
                  stylishTextField("Password", passwordController),
                ],
              ),
            ),
            vSizedBox4,
            // linha sobre LOGIN
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat"),
                          ),
                          TextSpan(
                            text: "Signup",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: SignupView(),
                                      type: PageTransitionType.rightToLeft),
                                );
                              },
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17,
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat"),
                          )
                        ],
                      ),
                    ),
                    vSizedBox2,
                    //BOTAO
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  stylishTextField(String text, TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      style: TextStyle(color: whiteColor, fontSize: 18.0),
      decoration: new InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            EvaIcons.backspace,
            color: textColor,
          ),
        ),
        filled: true,
        hintText: text,
        hintStyle: new TextStyle(color: textColor, fontSize: 14.0),
        fillColor: bgColor,
        border: new OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
