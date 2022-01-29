import 'package:clean_architecture/domain/login/usecase/do_login.dart';
import 'package:clean_architecture/ui/login/model/login_model.dart';
import 'package:clean_architecture/ui/login_mvp/login_view.dart';

abstract class LoginPresenter {
  onInit();
  onLoginBtnClicked(String token, String password);
}

class LoginPresenterImpl extends LoginPresenter {
  final LoginView view;
  final LoginModel model = LoginModel(isLogged: false, isLoading: false);

  LoginPresenterImpl(this.view);

  @override
  onInit() {
    bool isAuthenticated = false;

    if (isAuthenticated) view.navigateHome();
  }

  @override
  onLoginBtnClicked(String token, String password) async {
    view.showLoading();

    bool result = await DoLogin().execute(DoLoginParams(token, password));

    view.dismissLoading();

    if (result) {
      view.showLoginSuccess();
    }
  }
}