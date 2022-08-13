
import 'package:flutter/material.dart';
import 'package:project_dio_provider/services/dio_service.dart';
import 'package:project_dio_provider/views/home_view.dart';
import 'package:provider/provider.dart';
import 'new_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DioService dioService = DioService();

  @override
  void initState() {
    dioService.getResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider & Dio"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => dioService,
          child: Consumer<DioService>(
            builder:(context,model,index) => Stack(
              children: [
                DioService.isLoading
                    ?
                const Center(
                  child: CircularProgressIndicator(),
                    )
                    :
                ListView.builder(
                  itemCount: dioService.items!.length,
                  itemBuilder: (context,index){
                    return viewOfBody(dioService.items![index]);
                  })
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateUser()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
