import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<int> faktoriyelHesaplama(int a) async{

    int sonuc = 1;

     for (var i = 1 ; i<=a ; i++){
       sonuc = sonuc*i;

     }

    return sonuc;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: faktoriyelHesaplama(5),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  print("Hata : ${snapshot.error}");
                }

                if(snapshot.hasData){
                  return  Text("Data : ${snapshot.data}");
                  }else{
                   return Text("Data yok");
                  }
                },

            ),
          ],
        ),
      ),

    );
  }
}
