// Product class represents an item in the store
class Product {
  final String id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);
}

// Cart class manages the shopping cart items
class Cart {
  final List<Product> _items = [];

  void addProduct(Product product) {
    _items.add(product);
  }

  void removeProduct(Product product) {
    _items.remove(product);
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  List<Product> get items => List.from(_items);
}

// Order class represents a finalized purchase
class Order {
  final String id;
  final List<Product> products;
  final double total;
  final DateTime date;

  Order(this.id, this.products)
      : total = products.fold(0, (sum, item) => sum + item.price),
        date = DateTime.now();
}

// Main program
void main() {
  // Create some sample products
  final apple = Product('1', 'Apple', 0.99);
  final banana = Product('2', 'Banana', 1.25);
  final orange = Product('3', 'Orange', 0.75);

  // Create a cart
  final cart = Cart();

  // Add products to cart
  cart.addProduct(apple);
  cart.addProduct(banana);
  cart.addProduct(orange);

  // Print items in cart
  print('Items in cart:');
  cart.items.forEach((item) => print('${item.name}: \$${item.price}'));

  // Calculate and print total
  print('Total: \$${cart.totalPrice.toStringAsFixed(2)}');

  // Place an order
  final order = Order('order001', cart.items);
  print('\nOrder placed!');
  print('Order ID: ${order.id}');
  print('Order Total: \$${order.total.toStringAsFixed(2)}');
  print('Order Date: ${order.date}');
}