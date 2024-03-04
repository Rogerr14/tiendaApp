


import 'package:comisariato/utils/validator/validator_login.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //Recuperar los datos del Stream

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get formValidatorStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);
  //Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _emailController.value;
  String get password =>_passwordController.value;


  dispose() {
    _emailController.close();
    _passwordController.close();
  }
   

}