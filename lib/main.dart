import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/repositories/api.dart';
import 'package:money_manager/repositories/api_impl.dart';
import 'package:money_manager/repositories/log.dart';
import 'package:money_manager/repositories/log_impl.dart';
import 'package:money_manager/routes.dart';

import 'package:money_manager/routes.dart';
import 'package:money_manager/widgets/screens/login/login_screen.dart';

import 'main_cubit.dart';

class SimpleBlocObserver extends BlocObserver {
  final Log log;
  static const String TAG = "Bloc";

  const SimpleBlocObserver(this.log);

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log.i(TAG, 'onCreate: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    log.i(TAG, 'onEvent: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log.i(TAG, 'onChange: ${bloc.runtimeType}, change: ${change.nextState}');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,) {
    super.onTransition(bloc, transition);
    log.i(TAG, 'onTransition: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log.i(TAG, 'onError: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log.i(TAG, 'onClose: ${bloc.runtimeType}');
  }
}

void main() {
  Log log = LogImpl();
  Bloc.observer = SimpleBlocObserver(log);

  runApp(
    RepositoryProvider<Log>.value(
      value: log,
      child: Repository(),
    ),
  );
}

class Repository extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Api>(
      create: (context) => ApiImpl(context.read<Log>()),
      child: Provider(),
    );
  }
}

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            themeMode: state.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: mainRoute,
            initialRoute: LoginScreen.route,
          );
        },
      ),
    );
  }
}

