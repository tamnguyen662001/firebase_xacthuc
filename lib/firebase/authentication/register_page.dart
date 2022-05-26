

import 'package:firebase_1/firebase/authentication/authentication_methods.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  String? erorr;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passCfmCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng kí'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
               TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              const SizedBox(height: 10,),
               TextField(
                controller: passCtrl,
                decoration: const InputDecoration(
                  label: Text('Mật khẩu'),
                ),
              ),
              const SizedBox(height: 10,),
               TextField(
                controller: passCfmCtrl,
                decoration: const InputDecoration(
                  label: Text('Nhập lại mật khẩu'),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: size.width * 0.5,
                child: ElevatedButton(onPressed: (){
                  if(emailCtrl.text !="" && passCtrl.text!=""&& passCfmCtrl.text == passCtrl.text){
                    registerEmailPassword(email: emailCtrl.text, password: passCtrl.text).
                      then((value){
                        setState(() {
                          erorr = "Đăng nhập thành công";
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const LoginPage(),)
                        , (route) => false);
                    }).catchError((onError){
                      setState(() {
                        print('--------------------------------------');
                        print(onError);
                        erorr = onError;
                      });
                    });
                  }else{
                    print("c");
                  }
                },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      primary: Colors.blue[500],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.vpn_key_rounded),
                        Text('Đăng kí',style: TextStyle(color: Colors.white),),
                      ],
                    )
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      )
    );
  }
}
