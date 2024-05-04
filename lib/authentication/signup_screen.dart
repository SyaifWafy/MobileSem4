import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projekmobile_sem4/api_connection/api_connection.dart';
import 'package:projekmobile_sem4/authentication/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:projekmobile_sem4/model/user.dart';

class SignUpScreen extends StatefulWidget 
{
  

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> 
{
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnameController = TextEditingController();
  var pertanyaancontroller = TextEditingController();
  var jawabanController = TextEditingController();
  var isObsecure = true.obs;

  validateUserName()async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.validateUserName),
        body: {
          'username_cus': usernameController.text.trim(),
        },
      );

      if(res.statusCode == 200) //from flutter app the conection with api to server - succes
      {
        var resBodyOfValidateUsername = jsonDecode(res.body);

        if(resBodyOfValidateUsername['usernameFound']==true)
        {
          Fluttertoast.showToast(msg: "Username tersedia");
        }
        else
        {
          //register & save new user record to database
          registerAndSaveUserRecord();

        }

      }


    }
    catch(e)
    {

    }

  }
  registerAndSaveUserRecord() async
  {
    User userModel = User(
      usernameController.text.trim(),
      passwordController.text.trim(),
      fullnameController.text.trim(),
      pertanyaancontroller.text.trim(),
      jawabanController.text.trim()
    );
    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );
      if(res.statusCode == 200)
      {
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['succes']== true)
        {
          Fluttertoast.showToast(msg: "selamat anda berhasil daftar");
        }
        else
        {
          Fluttertoast.showToast(msg: "Coba Lagi");
        }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //SignUp Screeen header
                 // SizedBox(
                    //width: MediaQuery.of(context).size.width,
                    //height: 285,
                    //child: Image.asset(
                      //"Images/register.jpg",
                    //),
                  //),

                  //sognup screen form
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [

                          //username-password-signup button
                            Form(
                              key:formKey ,
                              child: Column(
                                children: [

                                  //username
                                  TextFormField(
                                    controller: usernameController,
                                    validator: (val) => val == "" ? "Please write username":null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.account_circle_sharp,
                                        color: Colors.black,
                                      ),
                                      hintText: "username...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 18,),

                                   //password
                                  Obx(
                                    () =>TextFormField(
                                    controller: passwordController,
                                    obscureText: isObsecure.value,
                                    validator: (val) => val == "" ? "Please write pasword":null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.vpn_key_sharp,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: Obx(
                                        ()=> GestureDetector(
                                          onTap: ()
                                          {
                                            isObsecure.value = !isObsecure.value;
                        
                                          },
                                          child: Icon(
                                            isObsecure.value ? Icons.visibility_off:  Icons.visibility,
                                            color: Colors.black,
                        
                                          ),
                                
                                        ),
                                      ),
                                      hintText: "pasword...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                     ),
                                  const SizedBox(height: 18,),

                                  //fullname
                                  TextFormField(
                                    controller: fullnameController,
                                    validator: (val) => val == "" ? "Please write fullname":null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.article,
                                        color: Colors.black,
                                      ),
                                      hintText: "fullname...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 18,),

                                  //pertanyaan
                                  TextFormField(
                                    controller: pertanyaancontroller,
                                    validator: (val) => val == "" ? "Please write Pertanyaan":null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.question_mark,
                                        color: Colors.black,
                                      ),
                                      hintText: "pertanyaan...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 18,),
                                  

                        
                                  //jawaban
                                  TextFormField(
                                    controller: jawabanController,
                                    validator: (val) => val == "" ? "Please write jawaban":null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.question_answer_sharp,
                                        color: Colors.black,
                                      ),
                                      hintText: "jawaban...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 18,),
                        
                                  //button
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: ()
                                      {
                                       if(formKey.currentState!.validate())
                                       {
                                        validateUserName();
                                       } 
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                          ),
                                          child: Text(
                                            "Daftar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                        
                                ],
                              ),
                            ),

                          //Daftar button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [  
                              TextButton(
                                onPressed: ()
                                {
                                  Get.to(LoginScreen());

                                },
                                child: const Text(
                                  "Kembali",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  

                ],
              ),
            ),
          );
        },
      ),
    );
    
  }
}
