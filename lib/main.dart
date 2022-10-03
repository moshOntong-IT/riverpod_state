import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_state/product.dart';

void main() {
  runApp(const MyApp());
}

final products = <Product>[
  Product(
      productId: 1,
      name: "Eggplant",
      price: 20.0,
      imagePath: "assets/vegetables/1.jpg"),
  Product(
      productId: 2,
      name: "Broccoli",
      price: 13.5,
      imagePath: "assets/vegetables/2.jpg"),
  Product(
      productId: 3,
      name: "Carrots",
      price: 10.8,
      imagePath: "assets/vegetables/3.jpg"),
  Product(
      productId: 4,
      name: "Pumpkin",
      price: 23.0,
      imagePath: "assets/vegetables/4.jpg"),
  Product(
      productId: 5,
      name: "Potato",
      price: 5.5,
      imagePath: "assets/vegetables/5.jpg"),
  Product(
      productId: 6,
      name: "Tomato",
      price: 11.2,
      imagePath: "assets/vegetables/6.jpg"),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vegetable Shop"), actions: [
        IconButton(
          icon: Badge(
              badgeContent: const Text('5'),
              child: const Icon(Icons.shopping_cart)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondScreen()));
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 0.5,
                        )
                      ],
                      image: DecorationImage(
                          image: AssetImage(products[index].imagePath),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${products[index].price}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                products.first.imagePath,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [Text("Product Name"), Text("\$0.0")],
                        )
                      ],
                    ),
                    const Text(
                      '5x',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, -4),
                  blurRadius: 10
                ),
              ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 const SizedBox(height: 50,child: Center(child: Text("Total: \$1000")),),
                  Expanded(child: ElevatedButton(child: const Text("Pay now"),onPressed: (){},),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
