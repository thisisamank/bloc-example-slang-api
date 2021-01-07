import 'package:bloc_test2/bloc/slang_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlangBloc>(
      create: (context) => SlangBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<SlangBloc, SlangState>(
              builder: (context, state) {
                if (state is SlangInitial) {
                  return Text("Press Button to get a slang");
                }
                if (state is SlangLoading) {
                  return CircularProgressIndicator();
                } else if (state is SlangLoaded) {
                  return Text('${state.slang.insult}');
                } else {
                  return Text("Something Went Wrong");
                }
              },
            ),
            RawMaterialButton(
              onPressed: () {
                BlocProvider.of<SlangBloc>(context).add(GetSlangEvent());
              },
              fillColor: Colors.yellow,
              child: Text("Get New Slang"),
            )
          ],
        ),
      ),
    );
  }
}
