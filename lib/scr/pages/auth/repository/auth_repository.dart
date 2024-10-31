import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/services/services.dart';

class AuthRepository {
  final HttpManager httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      print('works');
      print(result['result']);
    } else {
      print('error occured');
      print(result['error']);
    }

    // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}
