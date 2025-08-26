import 'package:flutter/material.dart';
void main()
{
  runApp(List_ex());
}

class List_ex extends StatelessWidget {
  const List_ex({super.key});


  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Name List"),),
        body: NameList(),
        
      ),
    );
  }
}

class NameList extends StatelessWidget {
  final List<String> names=['Jay','Ajay','Vijay','David'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index)
        {
          return ListTile(
            title: Text(names[index]),
            onTap: ()
            {
              print('${names[index]} tapped');
            },
          );
        }
    );


  }

}






