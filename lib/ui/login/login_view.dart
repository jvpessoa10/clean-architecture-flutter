
import 'package:clean_architecture/ui/core/components/horizontal_elevated_button.dart';
import 'package:clean_architecture/ui/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants.dart';
import 'model/login_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  final _loginFormKey = GlobalKey<FormState>();

  final _tokenController = TextEditingController();
  final _passwordController = TextEditingController();

  late final LoginBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Log In with the token",
          style: TextStyle(color: primaryColor, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: _onArrowBackPressed,
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "If you do not have a token, ask for meeting admin.",
              style: TextStyle(fontSize: 20),
            ),
            StreamBuilder(
                stream: bloc.loginModelStream,
                builder: (BuildContext context, AsyncSnapshot<LoginModel> state) {
                  if (state.hasData) {
                    if (state.data!.isLoading) {
                      return const Text("Loading...");
                    }
                    if (state.data!.isLogged) {
                      return const Text("Logged In!!");
                    }
                  }
                  return const Text("");
                }
            ),
            Form(
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _tokenController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Token',
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    )
                  ],
                )),
            HorizontalElevatedButton(
              text: "Log In",
              onPress: _onLoginPressed,
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    _getAppVersion(),
                    style: const TextStyle(fontSize: 16, color: normalColor),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Get the app version correctly
  String _getAppVersion() => "v 01.00.00";

  _onLoginPressed() {
    bloc.login(_tokenController.text, _passwordController.text);
  }

  _onArrowBackPressed() {

  }
}