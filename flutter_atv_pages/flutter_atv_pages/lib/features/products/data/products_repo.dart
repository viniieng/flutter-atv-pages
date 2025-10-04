import '../../../services/supabase_client.dart';

class Product {
  final int id;
  final String name;
  final double price;
  Product({required this.id, required this.name, required this.price});

  factory Product.fromMap(Map<String, dynamic> m) =>
      Product(id: m['id'] as int, name: m['name'] as String, price: (m['price'] as num).toDouble());
}

class ProductsRepo {
  Future<List<Product>> list() async {
    final res = await Sb.i.from('products').select().order('id', ascending: false);
    return (res as List).map((e) => Product.fromMap(e as Map<String, dynamic>)).toList();
  }
}
