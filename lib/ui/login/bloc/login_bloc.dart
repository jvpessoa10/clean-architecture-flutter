import 'dart:async';

import 'package:clean_architecture/domain/login/usecase/do_login.dart';
import 'package:clean_architecture/ui/core/Bloc.dart';
import 'package:clean_architecture/ui/login/model/login_model.dart';

class LoginBloc extends Bloc {

  LoginModel model = LoginModel(isLogged: false, isLoading: false);

  final _loginSteamController = StreamController<LoginModel>();

  Stream<LoginModel> get loginModelStream => _loginSteamController.stream;

  void login(String token, String password) async {
    //Fazer login, atualizar o estado
    model.isLoading = true;
    _loginSteamController.sink.add(model);

    bool result = await DoLogin().execute(DoLoginParams(token, password));

    model.isLoading = false;
    model.isLogged = result;

    _loginSteamController.sink.add(model);
  }

  @override
  void dispose() {
    _loginSteamController.close();
  }

}