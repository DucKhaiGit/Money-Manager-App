import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/widgets/common_widgets/noti_bar.dart';

import '../../../common/enum/load_status.dart';
import '../../../models/login.dart';
import '../../../repositories/api.dart';
import '../list_item/list_item_screen.dart';
import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<Api>()),
      child: Page(),
    );
  }
}

class Page extends StatelessWidget {
  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(notiBar("Login error", true));
        } else if (state.loadStatus == LoadStatus.Done){
          Navigator.of(context).pushNamed(ListItemScreen.route);
        }
      },
      builder: (context, state) {
        return state.loadStatus == LoadStatus.Loading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(32),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        decoration: InputDecoration(labelText: "Username"),
                        onChanged: (value) => _username = value),
                    TextField(
                        decoration: InputDecoration(labelText: "Password"),
                        onChanged: (value) => _password = value),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().checkLogin(
                              Login(username: _username, password: _password));
                        },
                        child: Text("Login")),
                  ],
                ),
              );
      },
    ));
  }
}
