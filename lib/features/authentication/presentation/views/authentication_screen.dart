import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment_delivery/core/services/injection_container.dart';
import 'package:shipment_delivery/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';
import 'package:shipment_delivery/features/deliveries/presentation/views/deliveries_list.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (_, state) {
              if (state is SignInError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                ));
              } else if (state is SignedIn) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) => sl<DeliveriesCubit>(),
                          child: Deliveries(token: state.auth.token)),
                    ));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Image
                      Image.asset(
                        'assets/images/chapar.png',
                        height: 200,
                        width: 200,
                      ),
                      // Email input field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'پست الترونیکی',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      // Password input field
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'رمز عبور',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      // Login button
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.7, // Set the width to match the parent's width
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            final email = emailController.text;
                            final password = passwordController.text;
                            context.read<AuthBloc>().add(LogInEvent(
                                email: email.trim(),
                                password: password.trim()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF31569A),
                            onPrimary: Colors.white,
                          ),
                          child: const Text(
                            'ورود',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
