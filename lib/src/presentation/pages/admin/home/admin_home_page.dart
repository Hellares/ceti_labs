import 'package:ceti_labs/main.dart';
import 'package:ceti_labs/src/presentation/pages/admin/category/list/admin_category_list_page.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/search_client.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/admin_device_list_page.dart';
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
    SearchClient(),
    AdminProductListPage(),
    AdminCategoryListPage(),
    AdminDeviceListPage()
  ];
  String _currentPageName(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 'Clientes';
      case 1:
        return 'Productos';
      case 2:
        return 'Categorías';
      case 3:
        return 'Dispositivos';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminHomeBloc>(context);
    return BlocBuilder<AdminHomeBloc, AdminHomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Menu',
              style: TextStyle(                
                fontFamily: 'pirulen',
                color: Color.fromARGB(255, 3, 101, 182),
                fontSize: 16),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _currentPageName(state.pageIndex).toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Araboto Normal 400',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color.fromARGB(255, 27, 27, 27)
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color.fromARGB(255, 27, 27, 27),
                        size: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          drawer: BlocBuilder<AdminHomeBloc, AdminHomeState>(
            builder: (context, state) {
              return Drawer(
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      child: DrawerHeader(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(    
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              CustomGradientText(
                                text: 'Administrador',
                                style: TextStyle(
                                    fontFamily: 'pirulen',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                gradient: LinearGradient(colors: const [
                                  Color.fromARGB(255, 1, 125, 241),
                                  Color.fromARGB(255, 52, 192, 9)
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.network(
                                  width: 45,
                                  'https://res.cloudinary.com/doglf2gsy/image/upload/v1717954553/j4aweaqyttwztduwkmwj.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:ListView(
                        padding: EdgeInsets.zero, 
                        children: <Widget>[                          
                          ListTile(
                            title: Text(
                              'Clientes',
                              style: TextStyle(
                                  fontFamily: 'pirulen',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 18, 137, 173),
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: state.pageIndex == 0,
                            onTap: () {
                              _bloc?.add(AdminChangeDrawerPage(pageIndex: 0));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Productos',
                              style: TextStyle(
                                  fontFamily: 'pirulen',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 18, 137, 173),
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: state.pageIndex == 1,
                            onTap: () {
                              _bloc?.add(AdminChangeDrawerPage(pageIndex: 1));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Categorias',
                              style: TextStyle(
                                  fontFamily: 'pirulen',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 18, 137, 173),
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: state.pageIndex == 2,
                            onTap: () {
                              _bloc?.add(AdminChangeDrawerPage(pageIndex: 2));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Dispositivos',
                              style: TextStyle(
                                  fontFamily: 'pirulen',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 18, 137, 173),
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: state.pageIndex == 3,
                            onTap: () {
                              _bloc?.add(AdminChangeDrawerPage(pageIndex: 3));
                              Navigator.pop(context);
                            },
                          ),
                          Divider(height: 50,),
                        ]
                      )
                    ),
                    Divider(),
                    ListTile(
                      title: CustomGradientText(
                        text: 'Cerrar Sesion',
                        style: TextStyle(fontFamily: 'pirulen', fontSize: 20),
                        gradient: LinearGradient(colors: const [
                          Color.fromARGB(255, 1, 125, 241),
                          Color.fromARGB(255, 52, 192, 9)
                        ])
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
                    SizedBox(height: 20),
                  ],
                ),
              );
          }),
          body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
              builder: (context, state) {
            return pageList[state.pageIndex];
          }),
        );
      },
    );
  }
}
