class catagory_item {
  String image;
  String name;
  int stock;

  catagory_item({
    required this.image,
    required this.name,
    required this.stock,
  });
}

List<catagory_item> category = [
  catagory_item(image: 'assets/category/vegetables.png', name: 'Vegetable', stock: 12),
  catagory_item(image: 'assets/category/fruits.jpg', name: 'Fruits', stock: 15),
  catagory_item(image: 'assets/category/Sweets.jpg', name: 'Sweets', stock: 12),
  catagory_item(image: 'assets/category/Dairy_product.jpg', name: 'Dairy product', stock: 36),
  catagory_item(image: 'assets/category/meet.jpg', name: "Meat and poultry", stock: 70),
  catagory_item(image: 'assets/category/Seafood.png', name: 'Seafood', stock: 46),
  catagory_item(image: 'assets/category/Snacks.jpg', name: 'Snacks', stock: 23),
  catagory_item(image: 'assets/category/oil.jpg', name: 'Oils and Fats', stock: 53),
];
