

import 'package:clean_architecture/data/login/repository/login_repository.dart';
import 'package:clean_architecture/domain/core/usecase.dart';

class DoLogin extends UseCase<DoLoginParams, bool>  {

  LoginRepository repository = LoginRepositoryImpl();

  @override
  Future<bool> execute(DoLoginParams param) {
    // TODO: implement execute
    return repository.login(param.username, param.password);
  }
}

class DoLoginParams {
  final String username;
  final String password;

  DoLoginParams(this.username, this.password);
}