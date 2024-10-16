import 'package:ecommerce/model/categories_data.dart';
import 'package:ecommerce/screen/home/components/item_category.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          listCategory.length, 
          (index){
            final CategoriesData category = listCategory[index];
            return ItemCategory(
              name: category.name, 
              icon: category.icon
            );
          }
        )
      ),
    );
  }
}
