import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/article.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../constants.dart';

class DetailScreen extends StatelessWidget {

  final Article article;

  const DetailScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBgColor2,
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
              icon: Icon(Icons.arrow_back_ios),
              color: kTitleColor,
              iconSize: 20.0,
              onPressed: (){
                Navigator.pop(context);
              },
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
                icon: Icon(Icons.share),
                color: kTitleColor,
                iconSize: 20.0,
                onPressed: () async{
                  Share.share(article.url);
                  print("yes");
                },
              ),
            ),
          ],
        ),
        backgroundColor: kBgColor2,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.open_in_new),
              heroTag: "go",
              onPressed: () async{

                  launch(article.url);
              },
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.thumb_up),
              onPressed: (){
              },
              heroTag: "like",
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(kDefaultPadding),
          padding: EdgeInsets.all(kDefaultPadding),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(30)
          ),
          child: ListView(
            children: <Widget>[
              Container(
                    width: 300,
                    height: 190,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(article.urlToImage, fit: BoxFit.cover,),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            "assets/images/profile.png",
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Bakari Potter",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(fontSize: 14)
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.save_alt),
                      color: kTitleColor,
                      iconSize: 20.0,
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.name,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(fontSize: 24)
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      article.title,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          textStyle: TextStyle(fontSize: 18)
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      article.content,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(fontSize: 16)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );

  }
}

