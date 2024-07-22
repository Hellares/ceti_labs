import 'package:ceti_labs/injection.dart';
import 'package:ceti_labs/src/bloc_providers.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/r_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/admin_device_list_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/admin_register_device_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/admin_home_page.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/login_page.dart';
import 'package:ceti_labs/src/presentation/pages/auth/register/register_page.dart';
import 'package:ceti_labs/src/presentation/pages/client/home/client_home.page.dart';
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
          'client/home':(BuildContext context) => const ClientHomePage(),
          'admin/home':(BuildContext context) => const AdminHomePage(),
          'admin/register/client/unosolo':(BuildContext context) => const RPage(),//registerCliente
          'admin/device/list':(BuildContext context) => const AdminDeviceListPage(),
          'admin/device/register':(BuildContext context) => const AdminRegisterDevicePage(),
    
        },
      ),
    );
  }
}