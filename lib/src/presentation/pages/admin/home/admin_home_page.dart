import 'package:ceti_labs/main.dart';
import 'package:ceti_labs/src/presentation/pages/admin/category/list/admin_category_list_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/admin_client_list_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/product/list/admin_product_list_page.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  AdminHomeBloc? _bloc;
  List<Widget> pageList = <Widget>[
    AdminClientListPage(),
    AdminProductListPage(),
    AdminCategoryListPage()
  ];

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Menu', style: TextStyle(fontFamily: 'pirulen', color: Colors.teal),),),
      drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder: (context, state) {
          return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget> [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 254, 254)
                    ),
                    child: Column(
                      
                      children: <Widget> [
                        SizedBox(height: 10,),
                        CustomGradientText(
                          text: 'Administrador',
                          style: TextStyle(
                            fontFamily: 'pirulen',
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                          gradient: LinearGradient(colors: const [Color.fromARGB(255, 1, 125, 241), Color.fromARGB(255, 52, 192, 9)]),
                        ),
                        SizedBox(height: 10,),
                        Image.network(
                          width: 45,
                          'https://res.cloudinary.com/doglf2gsy/image/upload/v1717954553/j4aweaqyttwztduwkmwj.png'),
                      ],
                    ),
                    
                                    
                  ),
                  ListTile(
                    title: Text('Clientes', style: TextStyle(fontFamily: 'pirulen', fontSize: 18, color: Color.fromARGB(255, 18, 137, 173), fontWeight: FontWeight.w500),),
                    selected: state.pageIndex == 0,
                    onTap: (){
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Productos', style: TextStyle(fontFamily: 'pirulen', fontSize: 18, color: Color.fromARGB(255, 18, 137, 173), fontWeight: FontWeight.w500),),
                    selected: state.pageIndex == 1,
                    onTap: (){
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Categorias', style: TextStyle(fontFamily: 'pirulen', fontSize: 18, color: Color.fromARGB(255, 18, 137, 173), fontWeight: FontWeight.w500),),
                    selected: state.pageIndex == 2,
                    onTap: (){
                      _bloc?.add(AdminChangeDrawerPage(pageIndex: 2));
                      Navigator.pop(context);
                    },
                  ),
                  Divider(height: 50,),
                  SizedBox(height: 50,),

                  ListTile(
                    title: CustomGradientText(
                      text: 'Cerrar Sesion', 
                      style: TextStyle(fontFamily: 'pirulen', fontSize: 20), 
                      gradient: LinearGradient(colors: const [Color.fromARGB(255, 1, 125, 241), Color.fromARGB(255, 52, 192, 9)])
                    ),
                    onTap: () {
                      _bloc?.add(AdminLogout());
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false
                      );
                    },
                  ),
                ],
              ),
            );
        },
      ),
      body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
        builder:(context, state){
          return pageList[state.pageIndex];
        }
      ),
    );
  }
}