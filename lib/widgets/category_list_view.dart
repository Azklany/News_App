import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(imageURL: "assets/business.png", categoryName: "Business"),
    CategoryModel(
        imageURL: "assets/entertaiment.png", categoryName: "Entertaiment"),
    CategoryModel(imageURL: "assets/general.png", categoryName: "General"),
    CategoryModel(imageURL: "assets/health.png", categoryName: "Health"),
    CategoryModel(imageURL: "assets/science.png", categoryName: "Science"),
    CategoryModel(imageURL: "assets/sports.png", categoryName: "Sports"),
    CategoryModel(
        imageURL: "assets/technology.jpeg", categoryName: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
