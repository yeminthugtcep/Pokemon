import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/bloc/bloc.dart';
import 'package:pokemon/pokemon/modal_object/dart_object.dart';
import 'package:pokemon/pokemon/modal_object/response_ob.dart';
import 'package:pokemon/pokemon/show_data.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final Bloc bloc = Bloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.GetData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: 150,
          child: Column(
            children: const [
              SizedBox(
                height: 50,
                child: Card(
                  child: Center(child: Text("Menu")),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 50,
                child: Card(
                  child: Center(child: Text("Exit")),
                ),
              ),
            ],
          )),
      appBar: AppBar(
        title: const Text("Pokemon"),
        centerTitle: true,
      ),
      body: StreamBuilder<ResponseOb>(
        stream: bloc.getStream(),
        initialData: ResponseOb(msgState: MsgState.loading),
        builder: (context, snapshot) {
          ResponseOb respOb = snapshot.data!;
          if (respOb.msgState == MsgState.data) {
            List<DartObjectPage> pkmList = respOb.data;
            return GridView.builder(
                itemCount: pkmList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext, index) {
                  return ShowData(pkmList[index]);
                });
          } else if (respOb.msgState == MsgState.error) {
            if (respOb.errState == ErrState.servierErr) {
              return const Center(
                child: Text("500\nServier Error"),
              );
            } else if (respOb.errState == ErrState.noFoundErr) {
              return const Text("404\nPage not Found");
            } else {
              return const Text("unknown Error");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
