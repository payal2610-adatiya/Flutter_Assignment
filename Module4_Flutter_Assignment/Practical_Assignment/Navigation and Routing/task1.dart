import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductListScreen())), child: Text("View Product")),
      ),
    );
  }
}

class ProductListScreen  extends StatelessWidget{
  final products =['Phone','Laptop','Tablet','Watch'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Products"),),
    body: ListView.builder(itemBuilder: (BuildContext context, int index)  => ListTile(
      title: Text((products[index])),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: products[index]))),
    ),)
    );
  }

}

class ProductDetailsScreen  extends StatelessWidget{
  final String product;
  ProductDetailsScreen({required this.product});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Details"),),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Product: $product ", style: TextStyle(fontSize: 20),),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Go back"))
         ],
       ),
     ),
   );
  }
}
