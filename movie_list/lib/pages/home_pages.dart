import 'package:flutter/material.dart';
import 'package:movie_list/models/item.dart';
import 'package:movie_list/widgets/bottom_navigasi.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
        name: 'EAFC 2024',
        description:
            "The EA SPORTS FC platform is home to the biggest competitions, leagues, and players across the men's and women's game.",
        prices: 5000,
        image: 'assets/eafc.jpg',
        stock: 10),
    Item(
        name: 'Football Manager 2024',
        description:
            "Football Manager 2024 is a football management simulation video game developed by Sports Interactive and published by Sega. It is part of its Football Manager series.",
        prices: 2000,
        image: 'assets/fm.jpg',
        stock: 10),
    Item(
        name: 'Valorant',
        description: "For cleaning your body",
        prices: 3000,
        image: 'assets/valo.png',
        stock: 20),
    Item(
        name: 'God Of War',
        description: "To wash your hair",
        prices: 5000,
        image: 'assets/gow.webp',
        stock: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart"),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text(item.name)),
                      Expanded(
                        child: Text(
                          item.prices.toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(selectedItem: 0),
    );
  }
}
