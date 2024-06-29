class vegname {
  String image;
  String name;
  String price;
  String weight;

  vegname({
    required this.image,
    required this.name,
    required this.price,
    required this.weight,
  });
}

List<vegname> vegetable = [
  vegname(name: 'Sprouting broccoli', price: '1.10',weight: '€/kg', image: 'assets/product/Vegetables/broccoli.jpg'),
  vegname(name: 'Romaine Lettuce', price: '1.10',weight: '€/piece', image: 'assets/product/Vegetables/romaine-lettuce.jpg'),
  vegname(name: 'Beetroot', price: '1.50',weight: '€/kg', image: 'assets/product/Vegetables/Beetroot.jpg'),
  vegname(name: 'Capsicums', price: '1.00',weight: '€/piece', image: 'assets/product/Vegetables/capsicums.jpg'),
  vegname(name: 'Cauliflower', price: '1.30',weight: '€/kg', image: 'assets/product/Vegetables/cauliflower.jpg'),
  vegname(name: 'Pumpkins', price: '0.10',weight: '€/piece', image: 'assets/product/Vegetables/pumpkin.jpg'),
];
