import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/ecommerce_layout.dart';
import 'package:e_commerce_layout/modules/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components.dart';
import '../register/register.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ECommerceLoginCubit(),
      child: BlocConsumer<ECommerceLoginCubit, ECommerceLoginStates>(
          builder: (context, state) => Scaffold(
                body: Center(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Login to see everything new...!',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                              validate: (v){
                                if(v.isEmpty){
                                  return 'please en';
                                }
                              },
                            onSubmit: (){},
                              onChange: (){},
                              obscure: false,
                              controller: emailController,
                              prefixIcon: Icons.email,
                              label: 'Email',
                              hint: 'Enter your email'),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            onSubmit: (){

                            },
                              obscure: ECommerceLoginCubit.get(context).isVisible,
                              validate: (v){
                              if(v.isEmpty){
                                return 'please en';
                              }
                              },
                              onChange: (){},
                              controller: passwordController,
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ECommerceLoginCubit.get(context)
                                        .passwordVisible();
                                  },
                                  icon: ECommerceLoginCubit.get(context).suffix),
                              onTab: () {
                                ECommerceLoginCubit.get(context).passwordVisible();
                              },
                              label: 'password',
                              hint: 'Enter your password'),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                              condition: state is! ECommerceLoginLoadingState,
                              builder: (context) {
                                return specialButton(
                                    text: 'login',
                                    onPress: (){
                                      // if(formKey.currentState!.validate()){
                                      //   ECommerceLoginCubit.get(context).userLogin(
                                      //       email: emailController.text,
                                      //       password: passwordController.text);
                                      //
                                      // }
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ECommerceLayout()));
                                    }
                                );
                              },
                              fallback: (context)=> const Center(child: CircularProgressIndicator(),)),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You Don\'t have an Email.. ?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: const Text('Register',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               RegisterScreen()));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          listener: (context, state) {
          }),
    );
  }
}
