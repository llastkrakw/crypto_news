import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/news_api_service.dart';
import 'package:news/models/article.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'compents/articleItem.dart';
import 'compents/pins.dart';
import 'compents/profile.dart';
import 'package:chopper/chopper.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBgColor1,
          centerTitle: true,
          title: Text("Crypto News", style: GoogleFonts.raleway(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
          leading: Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kTitleColor, width: 2)
            ),
            child: IconButton(
              icon: Icon(Icons.menu),
              color: kTitleColor,
              iconSize: 20.0,
              onPressed: (){},
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              width: 45,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kTitleColor, width: 2)
              ),
              child: IconButton(
                icon: Icon(Icons.save_alt),
                color: kTitleColor,
                iconSize: 20.0,
                onPressed: (){},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              width: 45,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kTitleColor, width: 2)
              ),
              child: IconButton(
                icon: Icon(Icons.notifications_none),
                color: kTitleColor,
                iconSize: 20.0,
                onPressed: (){},
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(kDefaultPadding),
          children: <Widget>[
            Profile(),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Pins("assets/icons/fire.png", "3/8"),
                Pins("assets/icons/call.png", "5/8"),
                Pins("assets/icons/wallet.png", "7/8"),
                Pins("assets/icons/coffe.png", "6/8"),
              ],
            ),
            SizedBox(height: 15,),
            Text(
              "Articles",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  textStyle: TextStyle(fontSize: 16)
              ),
            ),
            SizedBox(height: 15,),
            _buildArticle(context, itemWidth, itemHeight)
          ],
        )
    );

  }

  FutureBuilder<Response> _buildArticle(BuildContext context, double itemWidth, double itemHeight){

    return FutureBuilder<Response>(

      future: Provider.of<NewsApiService>(context).getNews(),

      builder: (context, snapshot){

        if(snapshot.connectionState == ConnectionState.done){

          List<Widget> articles = new List();

          print(snapshot);

          if(snapshot.data != null){

            var  articlesJson = json.decode(snapshot.data.bodyString);

            var articlesMap = articlesJson["articles"];

            for(int i=0; i < articlesMap.length; i++){

              if(articlesMap[i]['urlToImage'] != null && (i%2 != 0)){

                articles.add(ArticleItem(article: Article(
                    name: articlesMap[i]['source']['name'],
                    author: articlesMap[i]['author'],
                    title: articlesMap[i]['title'],
                    description: articlesMap[i]['description'],
                    url: articlesMap[i]['url'],
                    urlToImage: articlesMap[i]['urlToImage'],
                    publishedAt: articlesMap[i]['publishedAt'],
                    content: articlesMap[i]['content']
                ),));

              }

            }

          }

            return  GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (itemWidth / itemHeight) * 1.2,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: articles
            );

        }
        else{

          print(snapshot.connectionState);

          return GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (itemWidth / itemHeight) * 1.5,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  ),
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  ),
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  ),
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  ),
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  ),
                  CardSkeleton(
                    style: SkeletonStyle(
                      theme: SkeletonTheme.Light,
                      isShowAvatar: false,
                      isCircleAvatar: false,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      barCount: 5,
                      colors: [Colors.grey[100]],
                      backgroundColor: Color(0xffffffff),
                      isAnimation: false,
                    ),
                  )
                ]
            );
        }

      },
    );

  }
}






