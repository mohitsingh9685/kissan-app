class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String unit;
  bool isFavorite;   // Add this attribute
  int quantity;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.unit,
    this.isFavorite = false, // Default to false
    this.quantity = 1,
  });
}
List<GroceryItem> allGroceryItems = [
  ...fruits,
  ...pulses,
  ...grains,
  ...veggies,
  ...dairy,
  ...spices,

  // Add more categories here
];

List<GroceryItem> searchGroceryItems(String query) {
  return allGroceryItems.where((item) {
    return item.name.toLowerCase().contains(query.toLowerCase());
  }).toList();
}

/*
List<GroceryItem> searchGroceryItems(String query) {
  return demoItems.where((item) {
    return item.name.toLowerCase().contains(query.toLowerCase());
  }).toList();
}

 */


var demoItems = [
  GroceryItem(
      id: 1,
      name: "ऑर्गेनिक केले",
      description: "12pcs, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 2,
      name: "लाल सेब",
      description: "1kg, मूल्य",
      price: 80,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 3,
      name: "लाल शिमला मिर्च",
      description: "1kg, मूल्य",
      price: 50,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      id: 4,
      name: "बासमती चावल",
      description: "5Kg, मूल्य",
      price: 450,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/basmati.png"),
  GroceryItem(
      id: 5,
      name: "अंडे",
      description: "1 carat, मूल्य",
      price: 220,
      unit:"carat",
      imagePath: "assets/images/grocery_images/eggs.png"),
  GroceryItem(
      id: 6,
      name: "घी",
      description: "1 kg, मूल्य",
      price: 800,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/ghee.png"),
];

var exclusiveOffers = [demoItems[0], fruits[3]];

var bestSelling = [demoItems[1], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

var fruits = [
  GroceryItem(
      id:7,
      name: "ऑर्गेनिक केले",
      description: "12pcs, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 8,
      name: "लाल सेब",
      description: "1kg, मूल्य",
      price: 80,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 9,
      name: "पपीता",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/papita.png"),
  GroceryItem(
      id: 10,
      name: "आम",
      description: "1Kg, मूल्य",
      price: 40,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/mango.png"),
  GroceryItem(
      id: 11,
      name: "संतरा",
      description: "1kg, मूल्य",
      price: 60,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/orange.png"),
  GroceryItem(
      id: 12,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/sharifa.png"),
];
var veggies = [
  GroceryItem(
      id:13,
      name: "आलू",
      description: "5Kg, मूल्य",
      price: 150,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/aaloo.png"),
  GroceryItem(
      id: 14,
      name: "लाल शिमला मिर्च",
      description: "1kg, मूल्य",
      price: 50,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      id: 15,
      name: "प्याज़",
      description: "1Kg, मूल्य",
      price: 70,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/pyaj.png"),
  GroceryItem(
      id: 16,
      name: "लौकी",
      description: "1piece, मूल्य",
      price: 40,
      unit:"pcs",
      imagePath: "assets/images/grocery_images/lauki.png"),
  GroceryItem(
      id: 17,
      name: "पत्तागोभी",
      description: "1piece, मूल्य",
      price: 60,
      unit:"pcs",
      imagePath: "assets/images/grocery_images/cabbage.png"),
  GroceryItem(
      id: 18,
      name: "टमाटर",
      description: "1Kg, मूल्य",
      price: 50,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/tomato.png"),
];
var pulses = [
  GroceryItem(
      id:19,
      name: "चना दाल",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/chana.png"),
  GroceryItem(
      id: 20,
      name: "मूंग दाल",
      description: "1kg, मूल्य",
      price: 80,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/moong.png"),
  GroceryItem(
      id: 21,
      name: "अरहर दाल",
      description: "1Kg, मूल्य",
      price: 60,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/arhar.png"),
  GroceryItem(
      id: 22,
      name: "राजमा",
      description: "1Kg, मूल्य",
      price: 50,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/rajma.png"),
  GroceryItem(
      id: 23,
      name: "सूखे मटर",
      description: "1kg, मूल्य",
      price: 60,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/matar.png"),
  GroceryItem(
      id: 24,
      name: "उड़द दाल",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"Kg",
      imagePath: "assets/images/grocery_images/urad.png"),
];
var grains = [
  GroceryItem(
      id:25,
      name: "ऑर्गेनिक केले ",
      description: "12pcs, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 26,
      name: "लाल सेब",
      description: "1kg, मूल्य",
      price: 80,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 27,
      name: "पपीता",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/papita.png"),
  GroceryItem(
      id: 28,
      name: "आम",
      description: "1Kg, मूल्य",
      price: 40,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/mango.png"),
  GroceryItem(
      id: 29,
      name: "संतरा",
      description: "1kg, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/orange.png"),
  GroceryItem(
      id: 30,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/sharifa.png"),
  GroceryItem(
      id: 31,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/sharifa.png"),
];
var spices = [
  GroceryItem(
      id:32,
      name: "ऑर्गेनिक केले",
      description: "12pcs, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 33,
      name: "लाल सेब",
      description: "1kg, मूल्य",
      price: 80,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 34,
      name: "पपीता",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/papita.png"),
  GroceryItem(
      id: 35,
      name: "आम",
      description: "1Kg, मूल्य",
      price: 40,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/mango.png"),
  GroceryItem(
      id: 36,
      name: "संतरा",
      description: "1kg, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/orange.png"),

];
var dairy = [
  GroceryItem(
      id: 37,
      name: "घी",
      description: "1 kg, मूल्य",
       price: 800,
       unit:"Kg",
       imagePath: "assets/images/grocery_images/ghee.png"),
  GroceryItem(
      id: 38,
      name: "लाल सेब",
      description: "1kg, मूल्य",
      price: 80,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 39,
      name: "पपीता",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/papita.png"),
  GroceryItem(
      id: 40,
      name: "आम",
      description: "1Kg, मूल्य",
      price: 40,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/mango.png"),
  GroceryItem(
      id: 41,
      name: "संतरा",
      description: "1kg, मूल्य",
      price: 60,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/orange.png"),
  GroceryItem(
      id: 42,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/sharifa.png"),
  GroceryItem(
      id: 43,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/sharifa.png"),
  GroceryItem(
      id: 44,
      name: "शरीफ़ा",
      description: "1Kg, मूल्य",
      price: 90,
      unit:"dozen",
      imagePath: "assets/images/grocery_images/sharifa.png"),
];
