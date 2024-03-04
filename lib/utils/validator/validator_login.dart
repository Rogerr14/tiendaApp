import 'dart:async';

mixin class Validators {
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
     (password.length >= 6) ?
      sink.add(password)
      :sink.addError('Error');
    
  });


   final emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
      RegExp regExp = RegExp(r'^[a-zA-Z._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');    

      (regExp.hasMatch(email))
      ? sink.add(email)
      : sink.addError('Correo no valido');


    
      
  });

 
}


