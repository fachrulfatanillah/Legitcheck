import 'package:flutter/material.dart';
import 'package:legitcheck/views/detail_Product.dart';

class ListProductsOwn extends StatefulWidget {
  final Map<String, String> product;

  const ListProductsOwn({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ListProductsOwnState createState() => _ListProductsOwnState();
}

class _ListProductsOwnState extends State<ListProductsOwn> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://legitcheck.online/public/storage/storage/assets/images/products/${widget.product['photo']}',
            ),
          ),
        ),
      ),
      title: Text(
        widget.product['name']!,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        maxLines: 1,
        widget.product['description']!,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProductPage(product: widget.product)),
        );
      },
    );
  }
}
