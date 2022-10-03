import 'package:riverpod_state/product.dart';

class Cart{
  final Product product;
  final int quantity;
  final double total;

  Cart({required this.product, this.quantity = 0, this.total = 0.0,});
}