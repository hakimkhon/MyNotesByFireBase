import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/auth/auth_cubit.dart';
import 'package:mynotesfire/cubit/auth/auth_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: (BuildContext context, AuthState state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                children: [
                  Text(
                    "Sign up to Notes",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  20.verticalSpace,
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Inter email"),
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  20.verticalSpace,
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Inter password"),
                    controller: _controllerPassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  10.verticalSpace,
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                        children: [
                          const TextSpan(text: " "),
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                NavigationService.instance.navigateMyScreen(
                                  routeName: AppRoutesNames.login,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        backgroundColor: Colors.blue),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<AuthCubit>().registerUser(
                            email: _controllerEmail.text,
                            password: _controllerPassword.text,
                          );
                      debugPrint(
                          "Create account on Pressed:*******************************");
                    },
                    child: context.watch<AuthCubit>().state.formsStatus ==
                            FormsStatus.loading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            "Create account",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                  ),
                ],
              ),
            );
          },
          listener: (BuildContext context, AuthState state) {
            if (state.formsStatus == FormsStatus.authenticated) {
              NavigationService.instance.navigateMyScreenAndRemoveUntil(
                routeName: AppRoutesNames.home,
              );
            } else if (state.formsStatus == FormsStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.errorText,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
