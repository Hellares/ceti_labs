import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/admin_client_list_item.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/r_page.dart';
import 'package:ceti_labs/src/widgets/page_animation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminClientListPage extends StatefulWidget {
  const AdminClientListPage({super.key});

  @override
  State<AdminClientListPage> createState() => _AdminClientListPageState();
}

class _AdminClientListPageState extends State<AdminClientListPage> {
  late AdminClientListBloc? _bloc;

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetClients());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminClientListBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            PageAnimationRoutes(
              widget: const RPage(),
              ejex: 0.8,
              ejey: 0.8
            )
          );
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: BlocConsumer<AdminClientListBloc, AdminClientListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            // Si el estado es Success y los datos son de tipo bool, recargar clientes
            if (responseState.data is bool && responseState.data) {
              _bloc?.add(GetClients());
            }
          } else if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        }, 
        builder: (context,state) { 
          final responseState = state.response;
          if (responseState is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (responseState is Success) {
            List<User> users = responseState.data as List<User>;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return AdminClientListItem(_bloc, users[index]);
              },
            );
          } else if (responseState is Error) {
            return Center(child: Text('Error: ${responseState.message}'));
          } else {
            return Center(child: Text('No hay clientes disponibles.'));
          }
        },
      )
    );
  }
}