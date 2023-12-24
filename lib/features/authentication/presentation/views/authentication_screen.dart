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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Login'),
        ),
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
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 100),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          final email = emailController.text;
                          final password = passwordController.text;
                          context.read<AuthBloc>().add(LogInEvent(
                              email: email.trim(), password: password.trim()));
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                )));
          },
        ));
  }
}
