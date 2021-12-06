import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notificacao/app/shared/colors.dart';
import 'package:notificacao/app/shared/dimensions.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:notificacao/meta/views/auth/login_view.dart';
import 'package:page_transition/page_transition.dart';

class SignupView extends StatelessWidget {
  final nameController = TextEditingController();
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
            // vSizedBox3,
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
                    "Ola, Bem vindo!",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: whiteColor),
                  ),
                  Text(
                    "Convido voce pra essa Festa!",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: whiteColor),
                  ),
                  Text(
                    "Para mais informacoes.Preencha",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
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
                  stylishTextField("Name", nameController),
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
                            text: "Se caso houver uma conta? ",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat"),
                          ),
                          TextSpan(
                            text: "Logar",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: LoginView(),
                                      type: PageTransitionType.rightToLeft),
                                );
                              },
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: textColor,
                                fontSize: 18,
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
                          "Sign Up",
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
