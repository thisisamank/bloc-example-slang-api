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
        title: 'Slang Generator!',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Slang Generator"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 50,
              child: BlocBuilder<SlangBloc, SlangState>(
                builder: (context, state) {
                  if (state is SlangInitial) {
                    return Center(
                      child: Text("Press Button to get a slang"),
                    );
                  }
                  if (state is SlangLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SlangLoaded) {
                    return Center(
                      child: Text('${state.slang.insult}'),
                    );
                  } else {
                    return Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RawMaterialButton(
                onPressed: () {
                  BlocProvider.of<SlangBloc>(context).add(GetSlangEvent());
                },
                fillColor: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Get New Slang"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
