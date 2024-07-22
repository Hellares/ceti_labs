import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/admin_client_list_item.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/r_page.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';
import 'package:ceti_labs/src/widgets/page_animation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchClient extends StatefulWidget {
  const SearchClient({super.key});

  @override
  State<SearchClient> createState() => _SearchClientState();
}

class _SearchClientState extends State<SearchClient> {
  late AdminClientListBloc? _bloc;
  final TextEditingController _dniController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetClients());
    });
  }

  void _search() {
    final dni = _dniController.text;
    _bloc?.add(SearchClients(dni: dni));
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminClientListBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageAnimationRoutes(
              widget: const RPage(),
              ejex: 0.8,
              ejey: 0.8,
            ),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextFieldV3(
                      controller: _dniController,
                      label: 'Nro Dni / Nombres',
                      colorLabel: Colors.teal,
                      colorBorderFocus: Colors.teal,
                      onChanged: (text) {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {
                    _search();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.teal,
                    size: 40,
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<AdminClientListBloc, AdminClientListState>(
                listener: (context, state) {
                  final responseState = state.response;
                  if (responseState is Success) {
                    if (responseState.data is bool && responseState.data) {
                      _bloc?.add(GetClients());
                    }
                  } else if (responseState is Error) {
                    Fluttertoast.showToast(
                      msg: responseState.message,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }
                },
                builder: (context, state) {
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
                    return Center(
                        child: Text('Error: ${responseState.message}'));
                  } else {
                    return Center(child: Text('No hay clientes disponibles.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
