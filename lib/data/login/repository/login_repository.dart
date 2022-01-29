
abstract class LoginRepository {
  Future<bool> login(String token, String password);
}

class LoginRepositoryImpl extends LoginRepository {

  @override
  Future<bool> login(String token, String password) {
    // TODO: implement login
    return Future.delayed(
        const Duration(seconds: 5),
            () {
          return true;
        }
    );
  }

}