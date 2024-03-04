import 'package:comisariato/bloc/login_bloc.dart';
import 'package:comisariato/services/provider.dart';
import 'package:comisariato/services/usuario_provider.dart';
import 'package:comisariato/utils/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:comisariato/utils/constants/constants.dart';
import 'package:comisariato/utils/widgets/widgets.dart';


class RegisterPage extends StatelessWidget {
  static String name = 'registerScreen';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      body: SingleChildScrollView(
          child: Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 140.0),
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(90, 0, 0, 0),
                      spreadRadius: 5,
                      blurRadius: 10,
                    )
                  ],
                  color: Colors.white),
            ),
            const _FormularioLogin()
          ],
        ),
      )),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  const _FormularioLogin();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80.0),
      width: 350,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const _TitlePage(),
          const SizedBox(
            height: 40,
          ),
          textForm('correo@electronico.com', false, bloc.emailStream,
              bloc.changeEmail),
          const SizedBox(
            height: 30,
          ),
          textForm('contaseña', true, bloc.passwordStream, bloc.changePassword),
          const SizedBox(
            height: 20,
          ),
          const _ButtonLogin(),
          TextButton(
            onPressed: () => context.pushReplacement('/'),
            child: const Text('¿Ya tienes cuenta? Inicia sesión aquí'),
          )
        ],
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin();

  @override
  Widget build(BuildContext context) {
    final userProvider = UsuarioProvider();
    final bloc = Provider.of(context);
    return StreamBuilder(
      stream: bloc.formValidatorStream,
      builder: (context, snapshot) {
        return FilledButton(
          onPressed: (snapshot.hasData)
              ? () => _register(bloc, context, userProvider)
              : null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(fondoColor),
              elevation: MaterialStateProperty.all(2)),
          child: const Text(
            'INGRESAR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context,
      UsuarioProvider usuarioProvider) async {
    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    if (context.mounted) {
      (info['ok'])
          ? context.pushReplacement('/homeScreen')
          : showAlert(context, info['mensaje']);
    }
  }
}

class _TitlePage extends StatelessWidget {
  const _TitlePage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'CREAR CUENTA',
      style: TextStyle(
        fontSize: 40,
        color: fondoColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
