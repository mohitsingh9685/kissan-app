class CategoryItem {
  final int? id;
  final String name;
  final String imagePath;


  CategoryItem({this.id, required this.name, required this.imagePath

 });
}

var categoryItemsDemo = [
  CategoryItem(
    id:1,
    name: "ताज़े फल",
    imagePath: "assets/images/only fruits.png",
  ),
  CategoryItem(
    id:2,
    name: "सब्जियाँ",
    imagePath: "assets/images/veggies.png",
  ),
  CategoryItem(
    id:3,
    name: "दाल",
    imagePath: "assets/images/pulses.png",
  ),
  CategoryItem(
    id:4,
    name: "अनाज",
    imagePath: "assets/images/categories_images/grains.png",
  ),
  CategoryItem(
    id:5,
    name: "मसाले",
    imagePath: "assets/images/categories_images/spices.png",
  ),
  CategoryItem(
    id:6,
    name: "डेयरी और अंडे",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
];
