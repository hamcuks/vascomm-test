import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vascomm_test/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:vascomm_test/features/main/presentation/views/home_view.dart';
import 'package:vascomm_test/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  dependencySetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeView(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
