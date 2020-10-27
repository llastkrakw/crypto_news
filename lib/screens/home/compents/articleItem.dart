import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/article.dart';
import 'package:news/screens/detail/detail.dart';

class ArticleItem extends StatelessWidget {

  final Article article;

  const ArticleItem({
    Key key, this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: InkWell(
          splashColor: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(20),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      article: article,
                    )
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 130,
                    height: 90,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(article.urlToImage, fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  article.name,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(fontSize: 14)
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "${article.title.substring(0, (article.title.length / 1.5).floor())}...",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      textStyle: TextStyle(fontSize: 14)
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}