
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
      margin: EdgeInsets.symmetric(vertical: 7),
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 5, left: 7),
        leading: user != null
        ? SizedBox(
          width: 40,
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
            Text('${user?.name ?? ''} ${user?.lastname ?? ''}',style: TextStyle(fontFamily: 'Araboto Normal 400', fontWeight: FontWeight.w600, fontSize: 14, color: Color.fromARGB(255, 70, 68, 68)),),
            SizedBox(height: 5,),
            Text(user?.phone ?? '',style: TextStyle(fontFamily: 'Araboto Normal 400',letterSpacing: 1.0,fontWeight: FontWeight.w700, fontSize: 14, color: Color.fromARGB(255, 0, 113, 165)),),
          
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                  onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(100, 30), 
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  child: Text('Servicio +', style: TextStyle(fontFamily: 'Araboto Normal 400',fontWeight: FontWeight.w700,letterSpacing: 1.0, fontSize: 13, color: Color.fromARGB(255, 0, 113, 165)),),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 65,
                  child: ElevatedButton(                    
                  onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(65, 30), 
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  //child: Text('Servicio +', style: TextStyle(fontFamily: 'Oxygen-Regular',fontWeight: FontWeight.w700, fontSize: 12, color: Color.fromARGB(255, 0, 113, 165)),),
                  child: Icon(
                    Icons.call,
                    color: Colors.green[600],
                    size: 20,
                  ),
                                ),
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
                  size: 28,
                  color: Colors.green[600],
                ),
              ),
              IconButton(
                onPressed: (){
    
                }, 
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[400],
                  size: 28,
                ),
              ),
            ],
            
          ),
      ),
    );
  }
}