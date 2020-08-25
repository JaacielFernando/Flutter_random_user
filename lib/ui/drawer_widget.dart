import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:flutter_random_user_login/model/user.dart';
import 'package:flutter_random_user_login/model/user_response.dart';
import 'package:flutter_random_user_login/ui/text_widget.dart';
import 'package:flutter_random_user_login/bloc/user_bloc.dart';

class DrawerWidget extends StatefulWidget {
   @override
  State<StatefulWidget> createState() {
    return _DrawerWidgetState();
  }
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //estado necesario
  @override
  void initState() { 
    super.initState();
    bloc.getUser(); //importar bloc
  }


  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>( //importar modelo
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<UserResponse> snapshot) { //importar modelo
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API..."),
            
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error")
            ,
      ],
    ));
  }

  Widget _buildUserWidget(UserResponse data) {
    User user = data.results[0];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.picture.medium),
              ),/* Icon(
                Icons.account_circle,
                color: Colors.black,
              ) */
              title: TextWidget(
                  textAlign: TextAlign.left,
                  title: "Varopago ID:" + user.name.first,
                  textColor: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  isTitle: true),
              subtitle: TextWidget(
                textAlign: TextAlign.left,
                title: "Varopago ID:"+ user.location.city ,
                textColor: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                isTitle: true,
              ),
              /* onTap: () {
                Navigator.pushNamed(context, '/user-profile');
              }, */
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              title: Text(
                'Restablecer Contraseña',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(
                    context, '/set-password'); //cambiar a set-password
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
              title: Text(
                'Centro de ayuda',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20, bottom: 5, right: 30.0, left: 30.0),
            child: SizedBox(
                width: 70.0,
                // width: 110.0,
                height: 50.0,
                child: ButtonBar(children: <Widget>[
                  Text('hi')
                ],),),
          ),
        ],
      ),
    );

  }

  
}
