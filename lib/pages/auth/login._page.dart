import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challange_stenlyrachmad/global/dimension.dart';
import 'package:flutter_challange_stenlyrachmad/pages/auth/auth_controller.dart';
import 'package:flutter_challange_stenlyrachmad/globals/constant.dart';
import 'package:flutter_challange_stenlyrachmad/widgets/header1.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: Dimension.width120,
              child: Image.asset(
                'assets/image/header-login.png',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimension.height50),
                  height: Dimension.height80,
                  child: Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimension.width20,
                      vertical: Dimension.height20),
                  width: Dimension.width400,
                  height: Dimension.height400,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    // onChanged: () => controller.enableBtn.value =
                    //     _globalKey.currentState!.validate(),
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimension.width20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Header1(text: "Login"),
                                Text('Please sign in to continue'),
                              ],
                            )),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimension.width20),
                          child: Text(
                            "User ID",
                            style: TextStyle(fontSize: Dimension.font20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Dimension.height10,
                              horizontal: Dimension.width20),
                          height: Dimension.height80,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("User ID"),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: MultiValidator(
                              [
                                RequiredValidator(
                                    errorText: "Tidak boleh kosong"),
                                EmailValidator(
                                    errorText:
                                        "Masukan format email yang benar"),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimension.width20),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: Dimension.font20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Dimension.height10,
                            horizontal: Dimension.width20,
                          ),
                          height: Dimension.height80,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Password"),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: MultiValidator(
                              [
                                RequiredValidator(
                                    errorText: 'Tidak boleh kosong'),
                                MinLengthValidator(6,
                                    errorText: 'Harus lebih dari 6 karakter'),
                                PatternValidator(r'^(?=.*?[A-Z])(?=.*?[0-9])',
                                    errorText: 'Password tidak cukup kuat')
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(
                              vertical: Dimension.height20,
                              horizontal: Dimension.width20,
                            ),
                            child: ElevatedButton(
                              // onPressed: controller.enableBtn.value
                              // ? () => controller.redirect()
                              // : null,

                              onPressed: () {
                                if (_globalKey.currentState!.validate()) {
                                  Get.defaultDialog(
                                    title: "Selamat",
                                    content: const Text("Login Berhasil"),
                                  );
                                  controller.redirect();
                                } else {
                                  Get.defaultDialog(
                                    title: "Perhatian",
                                    content: const Text(
                                        "User ID dan Password anda belum diisi"),
                                    confirm: ElevatedButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("OK"),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.radius30))),
                              child: !(controller.isLoading.value)
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Dimension.width2,
                                          vertical: Dimension.height10),
                                      child: const Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimension.width50,
                                      ),
                                      child: const LinearProgressIndicator(),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width20,
                      vertical: Dimension.height20),
                  height: Dimension.height70,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimension.font18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: Dimension.font18,
                                    fontWeight: FontWeight.bold))
                          ]),
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
