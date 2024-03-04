import 'package:flutter/material.dart';
import 'package:comisariato/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  

  
  final loginBloc = LoginBloc();

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
 
  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
  }
}