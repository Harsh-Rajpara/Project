import 'package:booknowshow/pages/list_cinema_screen.dart';
import 'package:booknowshow/widgets/cast_crew_block.dart';
import 'package:booknowshow/widgets/offers_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/mytheme.dart';
// import '../utils/mytheme.dart';
// import '../utils/mytheme.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final dynamic model = Get.arguments[0];
  final int index = Get.arguments[1];

  titleWidget(model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Brahmastra",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite,
                color: MyTheme.splash,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${model.like}%",
                style: const TextStyle(fontSize: 10),
              )
            ],
          )
        ],
      );

  final screensWidget = Row(
    children: [
      Text(
        "Hindi",
        style: TextStyle(color: MyTheme.splash),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: MyTheme.splash.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "3D",
            style: TextStyle(color: MyTheme.splash),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: MyTheme.splash.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "2D",
            style: TextStyle(color: MyTheme.splash),
          ),
        ),
      )
    ],
  );

  final descriptionWidget = RichText(
      text: TextSpan(children: [
    WidgetSpan(
        child: Icon(
      Icons.history,
      size: 15,
    )),
    WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    TextSpan(
        text: "2h 47m",
        style: TextStyle(
          color: Colors.black45,
        )),
    WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    WidgetSpan(
        child: SvgPicture.asset(
      "assets/icons/theater_masks.svg",
      height: 15,
      width: 15,
      color: Colors.black45,
    )),
    WidgetSpan(
        child: SizedBox(
      width: 10,
    )),
    TextSpan(
        text: "Action, Adventure, Fantasy",
        style: TextStyle(
          color: Colors.black45,
        )),
  ]));

  Widget block1(model) => Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget(model),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "UA | sep 9, 2022",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    "1.8k votes",
                    style: TextStyle(color: MyTheme.splash),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              screensWidget,
              SizedBox(
                height: 10,
              ),
              descriptionWidget,
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => ListCinemaScreen(
                model: model,
              ),
            );
          },
          child: Container(
            width: double.maxFinite,
            height: 57,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/armchair.svg",
                  color: Colors.white,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Book Seats",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: MyTheme.splash,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: MyTheme.appBarColor,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(model.title),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "${model.title}$index",
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/brahmastra img.jpg"),
                  )),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Color(0xFFF5F5FA),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    block1(model),
                    SizedBox(
                      height: 20,
                    ),
                    OffersBlock(),
                    SizedBox(
                      height: 20,
                    ),
                    CrewCastBlock(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
