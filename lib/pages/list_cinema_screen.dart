import 'package:booknowshow/model/movie_model.dart';
import 'package:booknowshow/pages/view_all_screen.dart';
import 'package:booknowshow/utils/dummy_data.dart';
import 'package:booknowshow/utils/mytheme.dart';
import 'package:booknowshow/widgets/theatre_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ListCinemaScreen extends StatelessWidget {
  final MovieModel model;
  ListCinemaScreen({Key? key, required this.model}) : super(key: key);

  final DateFormat format = DateFormat("dd  MMM");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      bottomNavigationBar: BottomAppBar(
        color: MyTheme.appBarColor,
        elevation: 0,
        child: Container(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                    title: Text(
                      format.format (DateTime.now()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(model.title),
        actions: [
          IconButton(
            onPressed: () {
              //   showSerch(
              //     context:context,
              //     deLegate: MySearchDelegate(list: List, isMovie: menu.name.toLowerCase().contains("movies")
              // );
            },
            icon: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ],
      ),
      body: ListView.builder(
<<<<<<< HEAD
        itemCount: theatres.length,
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 20),
            // child:
            // // TheatreBlock(
            // //   model: theatres[index],
            // // )

        physics: const BouncingScrollPhysics(),
        itemCount:theatres.length,
        itemBuilder: (_,index) {
          return Container(
            padding:  EdgeInsets.only(bottom: index != theatres.length -1 ? 20 : 0),
            child: TheatreBlock(
              model: theatres[index],
            ),
>>>>>>> 8b4c841bfb86f7ee756e2b20e8855eade17adcff
          );
        },
      ),
    );
  }
}
