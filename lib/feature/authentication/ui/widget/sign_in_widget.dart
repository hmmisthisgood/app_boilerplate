import 'package:boilerplate/common/route/routes.dart';
import 'package:boilerplate/common/widget/textfield/custom_textfield.dart';
import 'package:boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInWidget extends StatefulWidget {
  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _hidePassword = true;

  final formKey = GlobalKey<FormState>();

  bool isConditionAccepted = false;

  void submit() async {
    final _email = emailController.text;
    final _password = passwordController.text;

    print(_email);
    print(_password);

    /// to hide the keyboard
    FocusScope.of(context).unfocus();
    final state = formKey.currentState;

    if (state != null) {
      bool isValidated = state.validate();

      if (isValidated == false) {
        return;
      }
      //// send data to server

      BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(
          emailController.text, passwordController.text);
    }
  }

  Widget buildLoadingIndicator() {
    // if (state is AuthLoading)
    return Container(
      height: 20,
      width: 20,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 1.5,
        // value: 0.3,
        // valueColor: AlwaysStoppedAnimation(Colors.black),
      ),
    );
    // else
    //   return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            ///

            if (state is AuthError) {
              Fluttertoast.showToast(msg: state.message);
            }
            if (state is AuthAuthenticated) {
              Fluttertoast.showToast(msg: "Login Success");
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.dashboard, (route) => false);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "Welcome to the app",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),

                        /// using common textfield widgets
                        CustomTextField(
                            controller: emailController,
                            validator: EmailValidator(
                                errorText: "Email must be valid"),
                            prefix: Icon(
                              Icons.email_outlined,
                            ),
                            hintText: "Enter you email"),

                        CustomTextField(
                          controller: passwordController,
                          hintText: "Enter your password",
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Password is required"),
                            MinLengthValidator(5,
                                errorText:
                                    "Password must be more than 5 characters"),
                            PatternValidator(r'(?=.*?[#?!@$%^&*])',
                                errorText:
                                    "Password must contain 1 special character")
                          ]),
                          prefix: Icon(
                            Icons.lock_outline,
                          ),
                          suffix: InkWell(
                            onTap: () {
                              _hidePassword = !_hidePassword; // false

                              setState(() {});
                              print("password is hidden: ");
                            },
                            child: Icon(
                              (_hidePassword == true)
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        MaterialButton(
                          onPressed: submit,
                          minWidth: double.infinity,
                          color: Colors.purple,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signup);
                          },
                          child: Text(
                            "Don't have an account? Sign up",
                            style: TextStyle(fontSize: 16),
                            // style: theme.h6,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                if (state is AuthLoading)
                  Container(
                    color: Colors.blue.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}


/// Form
/// TextField : cannot validate
/// TextFormField: can validate input
/// condition ? ---condition satisfy----- : ,,,,