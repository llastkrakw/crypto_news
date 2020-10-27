class Article{

  String name;
  String title;
  String author;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({this.name, this.title, this.author, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content});


  static Article getArticle(){

    return new  Article(
      name: "FXStreet",
      title: "Zcash Price Prediction: ZEC eyes \$70 despite crypto market bloodbath",
      author: "John Isige",
      description: "Zcash Price Prediction: ZEC eyes \$70 despite crypto market bloodbath",
      url : "https://www.fxstreet.com/cryptocurrencies/news/zcash-price-prediction-zec-eyes-70-despite-crypto-market-bloodbath-202010071007",
      urlToImage : "https://editorial.fxstreet.com/images/Markets/Currencies/Cryptocurrencies/cryptos_Large.jpg",
      publishedAt : "2020-10-07T10:07:57Z",
      content : "Bitcoin has stagnated at the local highs around \$10,700 over the past few hours and days. The leading cryptocurrency remains below the highs it set last week prior to the BitMEX news breaking. Analysts are still optimistic about the cryptocurrency despite the…\nBitcoin has stagnated at the local highs around \$10,700 over the past few hours and days. The leading cryptocurrency remains below the highs it set last week prior to the BitMEX news breaking. Analysts are still optimistic about the cryptocurrency despite the…",
    );

  }
}

