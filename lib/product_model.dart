class ProductModel {
  final String name;
  final double price;
  int quantity;

  double getTotalPrice() => price * quantity;

  ProductModel({required this.name, this.quantity = 1, required this.price});
}

List<ProductModel> products = [
  ProductModel(name: "Tshirt", price: 550),
  ProductModel(name: "iphone", price: 95000),
  ProductModel(name: "Pant", price: 1500),
  ProductModel(name: "Laptop", price: 75000),
  ProductModel(name: "Glass", price: 300),
];
