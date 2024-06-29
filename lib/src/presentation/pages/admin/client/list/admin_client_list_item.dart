
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_bloc.dart';
import 'package:flutter/material.dart';

class AdminClientListItem extends StatelessWidget {
  final AdminClientListBloc? bloc;
  final User? user;
  const AdminClientListItem(this.bloc, this.user,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 5, left: 7),
        leading: user != null
        ? SizedBox(
          width: 45,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/img/no-image.png', 
            image: user!.image!,
            fit: BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
          ),
        )
        : Container(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${user?.name ?? ''} ${user?.lastname ?? ''}',style: TextStyle(fontFamily: 'Oxygen-Regular', fontWeight: FontWeight.w700,fontSize: 16, color: const Color.fromARGB(255, 8, 150, 126)),),
            SizedBox(height: 5,),
            Text(user?.phone ?? '',style: TextStyle(fontFamily: 'Oxygen-Regular',fontWeight: FontWeight.w700, fontSize: 14, color: Color.fromARGB(255, 0, 113, 165)),),
            //SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(100, 35), 
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                child: Text('Servicio +', style: TextStyle(fontFamily: 'Oxygen-Regular',fontWeight: FontWeight.w700, fontSize: 14, color: Color.fromARGB(255, 0, 113, 165)),),
                )
              ],
            )
          ],
        ),
        trailing : Wrap(
            direction: Axis.horizontal,
            children: [
              IconButton(
                onPressed: (){
                  //Navigator.pushNamed(context, 'admin/category/update', arguments: category);
                }, 
                icon: Icon(
                  Icons.note_alt_outlined,
                  size: 30,
                  color: Colors.green[600],
                ),
              ),
              IconButton(
                onPressed: (){
    
                }, 
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[400],
                  size: 30,
                ),
              ),
            ],
            
          ),
      ),
    );
  }
}