import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/main_cubit.dart';

class SettingScreen extends StatefulWidget {

  static const String route = "SettingScreen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var isLightTheme = state.isLightTheme;
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Light Theme"),
            value: isLightTheme, onChanged: (value) {
            setState((){
              isLightTheme = value ?? true;
              context.read<MainCubit>().setTheme(isLightTheme);
            });
          },
          )
        ],
        ),
        );
      },
    );
  }
}
