
import 'package:comisariato/screens/screens.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/' ,
      name: LoginPage.name,
      builder:  (context, state) => const LoginPage(),
      ),
    GoRoute(
      path: '/registerScreen' ,
      name: RegisterPage.name,
      builder:  (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/homeScreen' ,
      name: HomeScreen.name,
      builder:  (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/productsScreen' ,
      name: ProductsScreen.name,
      builder:  (context, state) =>  ProductsScreen(),
    ),
  ],
);
