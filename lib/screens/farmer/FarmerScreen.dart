
/*import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmerPage(),
    );
  }
}

class FarmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('मेरे उत्पाद'),
        backgroundColor: Colors.green,
        /*actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ], */
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          productCard(
            'चावल',
            'प्रीमियम खुशबूदार चावल!',
            '60.0',
            '10.0',
            'kg',
          ),
          productCard(
            'बासमती चावल',
            'प्रीमियम खुशबूदार चावल! अनूठी खुशबू। स्वस्थ सुपरग्रेन! प्राकृतिक खेती में उगाया गया।',
            '40.0',
            '100.0',
            'kg',
          ),
          addProductCard(),
        ],
      ),
      drawer: FarmerDrawer(),
    );
  }

  Widget productCard(String title, String description, String price, String quantity, String unit) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/rise.png', // Replace with your image asset path
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(description),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('प्रति इकाई मूल्य: '),
                SizedBox(width: 5),
                Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text('मात्रा: '),
                SizedBox(width: 5),
                Text(quantity, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text(unit),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addProductCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.add, size: 50),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'शीर्षक',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'विवरण',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('प्रति इकाई मूल्य: '),
                SizedBox(width: 5),
                Text('0.0', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text('मात्रा: '),
                SizedBox(width: 5),
                Text('0.0', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text('दर्जन'),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('अपडेट'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 */
// mohit code below
/*
import 'package:flutter/material.dart';
import 'drawer.dart';
import '../welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmerPage(),
    );
  }
}

class FarmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigate to WelcomeScreen
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WelcomeScreen())
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductCard(
              imageUrl: 'assets/images/rise.png',
              title: 'Rice',
              description: 'Fresh rice grown in farm in proper condition, no chemical used',
              amountPerUnit: 60.0,
              quantity: 10.0,
              unit: 'kg',
            ),
            SizedBox(height: 16.0),
            ProductCard(
              imageUrl: 'assets/images/pulses.png',
              title: 'Mix Dal',
              description: 'Premium Aromatic dal! Unique Fragrance. A healthy supergrain! Grown in Natural Farming.',
              amountPerUnit: 40.0,
              quantity: 100.0,
              unit: 'kg',
            ),
            SizedBox(height: 16.0),
            AddProductCard(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement your update functionality here
              },
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
          ],
        ),
      ),
      drawer: FarmerDrawer(),
    );
  }
}
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double amountPerUnit;
  final double quantity;
  final String unit;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.amountPerUnit,
    required this.quantity,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount per unit'),
                            Text(
                              '$amountPerUnit',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quantity'),
                            Text(
                              '$quantity $unit',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [ Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Background color for the icon
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, size: 30, color: Colors.grey[700]),
              ),
                // Icon(Icons.add, size: 50, color: Colors.grey),
                SizedBox(width: 16.0,),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount per unit'),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantity'),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

 */
////////////////////////////after add all functionality

import 'package:flutter/material.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmerPage(),
    );
  }
}

class FarmerPage extends StatefulWidget {
  @override
  _FarmerPageState createState() => _FarmerPageState();
}

class _FarmerPageState extends State<FarmerPage> {
  List<Map<String, dynamic>> products = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addProduct() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        products.add({
          'title': titleController.text,
          'description': descriptionController.text,
          'amountPerUnit': double.tryParse(amountController.text) ?? 0.0,
          'quantity': double.tryParse(quantityController.text) ?? 0.0,
          'isEditing': false,
        });
        titleController.clear();
        descriptionController.clear();
        amountController.clear();
        quantityController.clear();
      });
    }
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void toggleEditMode(int index) {
    setState(() {
      products[index]['isEditing'] = !(products[index]['isEditing'] ?? false);
    });
  }

  void saveEdit(int index, String newTitle, String newDescription, double newAmount, double newQuantity) {
    setState(() {
      products[index] = {
        'title': newTitle,
        'description': newDescription,
        'amountPerUnit': newAmount,
        'quantity': newQuantity,
        'isEditing': false,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Any code to update the changes or refresh the page can go here
              });
            },
            child: Text(
              'Update',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(

              key: _formKey,

              child: AddProductCard(

                titleController: titleController,

                descriptionController: descriptionController,

                amountController: amountController,

                quantityController: quantityController,

              ),

            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: addProduct,
              child: Text(
                'Add Product',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return ProductCard(
                    title: product['title'],
                    description: product['description'],
                    amountPerUnit: product['amountPerUnit'],
                    quantity: product['quantity'],
                    isEditing: product['isEditing'] ?? false,
                    onEdit: () => toggleEditMode(index),
                    onSave: (newTitle, newDescription, newAmount, newQuantity) =>
                        saveEdit(index, newTitle, newDescription, newAmount, newQuantity),
                    onDelete: () => deleteProduct(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: FarmerDrawer(),
    );
  }
}

class AddProductCard extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final TextEditingController quantityController;

  AddProductCard({
    required this.titleController,
    required this.descriptionController,
    required this.amountController,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /*
                Container(
                 width: 50,
                 height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: 30, color: Colors.grey[700]),
                ),
                SizedBox(width: 16.0),
               */
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 4.0),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount per unit'),
                      TextFormField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This cannot be empty';
                          } else if (int.tryParse(value) == null) {
                            return 'Enter an integer value';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantity'),
                      TextFormField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This cannot be empty';
                          } else if (int.tryParse(value) == null) {
                            return 'Enter an integer value';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final double amountPerUnit;
  final double quantity;
  final bool isEditing;
  final VoidCallback onEdit;
  final Function(String, String, double, double) onSave;
  final VoidCallback onDelete;

  ProductCard({
    required this.title,
    required this.description,
    required this.amountPerUnit,
    required this.quantity,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
    required this.onDelete,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController amountController;
  late TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    amountController = TextEditingController(text: widget.amountPerUnit.toString());
    quantityController = TextEditingController(text: widget.quantity.toString());
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.isEditing
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Amount per unit'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Quantity'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onSave(
                      titleController.text,
                      descriptionController.text,
                      double.tryParse(amountController.text) ?? 0.0,
                      double.tryParse(quantityController.text) ?? 0.0,
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.0),
            Text(widget.description),
            SizedBox(height: 4.0),
            Text('Amount per unit: ${widget.amountPerUnit}'),
            Text('Quantity: ${widget.quantity}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: widget.onEdit,
                  child: Text('Edit'),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: widget.onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


