import 'package:dokan_ecommerce/constants/routes.dart';
import 'package:dokan_ecommerce/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:dokan_ecommerce/models/category_model/category_model.dart';
import 'package:dokan_ecommerce/models/product_model/product_model.dart';
import 'package:dokan_ecommerce/screens/product_details/product_details.dart';
import 'package:dokan_ecommerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;
  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              // primary: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopTitles(subtitle: "", title: 'E-Commerce'),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search_outlined),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  categoriesList.isEmpty
                      ? const Center(
                          child: Text('Categories is empty!'),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(e.image)),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(top: 12, left: 12),
                    child: Text(
                      'Best Products ${productModelList.length}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  bestProducts.isEmpty
                      ? const Center(
                          child: Text('Best Products is empty!'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: bestProducts.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.8,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                ProductModel singleProduct =
                                    bestProducts[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 12),
                                      Image.network(
                                        singleProduct.image,
                                        height: 60,
                                        width: 60,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price: \$ ${singleProduct.price}",
                                      ),
                                      const SizedBox(height: 30),
                                      SizedBox(
                                        height: 45,
                                        width: 140,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singleProduct),
                                                  context: context);
                                            },
                                            child: const Text(
                                              'Buy',
                                            )),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                ],
              ),
            ),
    );
  }
}

// List<String> categoriesList = [
//   'https://cdn.pixabay.com/photo/2021/03/15/18/10/food-6097624_1280.png',
//   'https://img.freepik.com/premium-vector/vector-illustration-authentic-indian-hyderabadi-mutton-biryani_466689-23754.jpg?w=360',
//   'https://www.nicepng.com/png/full/168-1681394_food-vegetables-fruits-and-sweets-vector-png-different.png',
//   'https://cdn.pixabay.com/photo/2022/10/06/22/22/pizza-7503664_640.png',
//   'https://www.nicepng.com/png/full/20-204281_fast-food-veggie-burger-junk-vector-handpainted-fast.png',
// ];

List<ProductModel> bestProducts = [
  ProductModel(
    image:
        "https://cdn.pixabay.com/photo/2022/11/25/00/13/banana-7615187_1280.png",
    id: "1",
    name: "Banana",
    price: "1",
    description: "This is good for health",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://mnib.gd/wp-content/uploads/2021/07/CeylonMango-1.png",
    id: "1",
    name: "Mango",
    price: "2",
    description: "This is good for health you can eat it",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://onapples.com/uploads/varieties/3y3v9tyf8h96.png",
    id: "3",
    name: "Apple",
    price: "3",
    description: "This is good for health",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://cdn.pixabay.com/photo/2022/11/25/00/13/banana-7615187_1280.png",
    id: "4",
    name: "Banana",
    price: "1",
    description: "This is good for health",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://cdn.pixabay.com/photo/2022/11/25/00/13/banana-7615187_1280.png",
    id: "5",
    name: "Banana",
    price: "1",
    description: "This is good for health",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://cdn.pixabay.com/photo/2022/11/25/00/13/banana-7615187_1280.png",
    id: "6",
    name: "Banana",
    price: "1",
    description: "This is good for health",
    status: "pending",
    isFavourite: false,
  ),
];
