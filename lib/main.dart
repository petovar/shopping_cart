import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/presentation/bloc/listaDeseos/listadeseos_bloc.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListadeseosBloc>(create: (_) => ListadeseosBloc() )
      ], 
      child: App(),
    );
  }
}

