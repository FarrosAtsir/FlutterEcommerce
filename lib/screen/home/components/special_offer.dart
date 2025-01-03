import 'package:ecommerce/screen/home/components/section_title.dart';
import 'package:ecommerce/screen/home/components/special_offer_card.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(title: "Special For You",),
        ),
        SizedBox(height: getPropScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
            child: Row(
              children: [
                SpecialOfferCard(
                  image: "assets/images/Image Banner 2.png",
                  category: "Smartphone",
                  numOfBrands: "18",
                  press: () {
            
                  },
                  ),
                SpecialOfferCard(
                  image: "assets/images/Image Banner 3.png",
                  category: "Fashion",
                  numOfBrands: "20",
                  press: () {
            
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
