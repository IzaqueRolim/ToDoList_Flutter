import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{
  final items = <String>[];
 
  late TextEditingController _controller;

  Color cor = Color.fromARGB(255, 105, 162, 255);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("List"),backgroundColor: Colors.black,),
      body: SingleChildScrollView(
        child:Center(child:Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(hintText: "Insira o texto",border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                 controller:_controller),
            ),
            IconButton(onPressed: (){
              setState((){
                if(_controller.text!=""){
                  items.add(_controller.text);
                  _controller.text = "";
                }
              });
            }, icon: const Icon(Icons.add),color: Colors.green,),
            Column(
              children: [
                for(var i = 0;i<items.length;i++)
                  AnimatedContainer(
                    width:  200.0,
                    height: 80.0,
                    color: cor,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    duration: const Duration(microseconds: 5),
                    curve: Curves.fastOutSlowIn,
                    child:  TextButton(onPressed: (){
                      setState((){
                        items.remove(items[i]);
                      });
                    }, child: Text(items[i], style: TextStyle(color: Colors.white),)),
                  ),
              ],
            )
            ],))
      ),
    );
  }
}

