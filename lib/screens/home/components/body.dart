import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotesapp/constants.dart';
import 'package:quotesapp/screens/home/components/header_with_searchbox.dart';
import 'package:quotesapp/screens/home/components/recommend_plants.dart';
import 'package:quotesapp/screens/home/components/title_with_more_btn.dart';

import 'featured_plants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //It will provide the total height of the screen
    Size size = MediaQuery.of(context).size;
    //It will allow scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: 'Recomended', press: () {}),
          RecommendsPlants(),
          TitleWithMoreBtn(title: 'FeaturedPlants', press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
