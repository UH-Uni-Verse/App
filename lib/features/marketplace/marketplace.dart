import 'package:flutter/material.dart';
import 'package:app/features/home.dart';
import 'package:app/features/user/profile.dart';
import 'package:app/features/user/messages.dart';
import 'package:app/features/marketplace/data/marketplace_provider.dart';
import 'package:app/features/marketplace/data/marketplace_data.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  List<UserData3> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to shopping cart page or show a bottom sheet with cart details
              // For simplicity, we will just print the cart items here
              print('Cart Items: $_cartItems');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: userDB3.items.length, // Corrected access to items property
        itemBuilder: (context, index) {
          UserData3 item = userDB3.items[index];
          return GestureDetector(
            child: Container(
              height: MediaQuery.of(context).size.height / 4, // Adjust the height as needed
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 8, // Adjust the height as needed
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name),
                          Text('Price: \$${item.price}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text("Home Page"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
            ),
            ListTile(
              title: Text("Profile Page"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text("Messages"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MessagesPage()));
              },
            ),
            ListTile(
              title: Text("Marketplace"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MarketplacePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

}
