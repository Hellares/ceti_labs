import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceti_labs/src/domain/models/role.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_state.dart';
import 'package:ceti_labs/src/presentation/pages/roles/roles_item.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state){
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:const [
                  Color.fromARGB(234, 220, 245, 255), // Puedes cambiar estos colores por los que prefieras
                  Color.fromARGB(255, 255, 255, 255),
                ],
              ),
            ),
            alignment: Alignment.center,

            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 15),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  alignment: Alignment.bottomCenter,
                  child: CustomGradientText(
                    text: 'Seleccione su Rol',
                    style: TextStyle(
                      fontFamily: "pirulen",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    gradient: LinearGradient(
                      colors: const [Color.fromARGB(255, 12, 151, 216), Color.fromARGB(255, 49, 252, 252), Color.fromARGB(255, 12, 151, 216)],
                    ),
                  ),
                ),
  
                Center(
                  child: ListView(
                  shrinkWrap: true,
                  children: state.roles != null ? (state.roles?.map((Role? role){
                    return role != null ? RolesItem(role) : Container();
                  }).toList()) as List<Widget> : [],
                              ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}