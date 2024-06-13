import 'package:ceti_labs/injection.dart';
import 'package:ceti_labs/src/bloc_providers.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/login_page.dart';
import 'package:ceti_labs/src/presentation/pages/auth/register/register_page.dart';
import 'package:ceti_labs/src/presentation/pages/roles/roles_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login':(BuildContext context) => const LoginPage(),
          'register':(BuildContext context) => const RegisterPage(),
          'roles':(BuildContext context) => const RolesPage(),
    
        },
      ),
    );
  }
}