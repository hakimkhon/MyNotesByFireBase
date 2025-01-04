import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotesfire/cubit/auth/auth_cubit.dart';
import 'package:mynotesfire/cubit/auth/auth_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/screens/home_screen.dart';

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
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Inter email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Inter password"),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 50),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
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
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
