import 'package:dokan_ecommerce/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoriesList
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 100, width: 100, child: Image.network(e)),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> categoriesList = [
  'https://cdn.pixabay.com/photo/2021/03/15/18/10/food-6097624_1280.png',
  'https://img.freepik.com/premium-vector/vector-illustration-authentic-indian-hyderabadi-mutton-biryani_466689-23754.jpg?w=360',
  'https://www.nicepng.com/png/full/168-1681394_food-vegetables-fruits-and-sweets-vector-png-different.png',
  'https://cdn.pixabay.com/photo/2022/10/06/22/22/pizza-7503664_640.png',
  'https://www.nicepng.com/png/full/20-204281_fast-food-veggie-burger-junk-vector-handpainted-fast.png',
];
