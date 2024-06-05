import 'package:legitcheck/models/model_Categories.dart';
import 'package:legitcheck/models/model_User_Products.dart';
import 'package:legitcheck/viewmodels/view_Model_Categories.dart';
import 'package:legitcheck/viewmodels/view_Model_User_Products.dart';

class GetCategories {
  Future<List<Map<String, String>>> categories() async {
    List<Map<String, String>> categories = [];
    int counter = 0;
    try {
      CategoriesGet categoryRepository = CategoriesGet();

      List<Categories> ct = await categoryRepository.getCategories();
      categories.add({
        'id': counter.toString(),
        'title': 'All',
      });
      counter++;
      for (var data in ct) {
        categories.add({
          'id': counter.toString(),
          'title': data.category,
        });
        counter++;
      }
    } catch (e) {
      print(e);
    }
    return categories;
  }
}

class GetProductsUser {
  Future<List<Map<String, String>>> listProductsUser(String userId) async {
    List<Map<String, String>> listProducts = [];

    try {
      UserProductsGet productsRepository = UserProductsGet();
      List<UserProducts> data =
          await productsRepository.getUserProducts(userId);
      for (var i in data) {
        listProducts.add({
          'id': i.id,
          'qrcode_id': i.qrcode_id,
          'id_product': i.id_product,
          'photo': i.photo,
          'name': i.name,
          'description': i.description,
          'size': i.size,
          'category': i.category,
        });
      }
      print(data);
    } catch (e) {
      print(e);
    }
    return listProducts;
  }
}

class Filter {
  List<Map<String, String>> getFilteredProducts(
      String selectedCategory, List<Map<String, String>> products) {
    if (selectedCategory == 'All') {
      return products;
    } else {
      return products
          .where((product) => product['category'] == selectedCategory)
          .toList();
    }
  }
}
