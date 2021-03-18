import 'package:flutter/material.dart';

main(){
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Quote'),
      ),
      body: ListView(
        children: [
          BuildQuote('Fear ain\'t great thing we should do.','-jirayuwat1','https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-1/p160x160/31890355_2021595088099610_8172370960880500736_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHud3uhBAyPQMQ7vdtB1iYQEoIeT-bek6ESgh5P5t6ToeoUunnJH_0_KmaIjLj4mH3000iEuhk8PKagQY-6FZeJ&_nc_ohc=kBeua-Pk8UAAX-7hrqd&_nc_ht=scontent.fbkk5-5.fna&tp=6&oh=2b32ea64944e31d53514b31ac736a0ff&oe=6075D706'),
          BuildQuote('Fear ain\'t great thing we should do.','-jirayuwat2','https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-1/p160x160/31890355_2021595088099610_8172370960880500736_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHud3uhBAyPQMQ7vdtB1iYQEoIeT-bek6ESgh5P5t6ToeoUunnJH_0_KmaIjLj4mH3000iEuhk8PKagQY-6FZeJ&_nc_ohc=kBeua-Pk8UAAX-7hrqd&_nc_ht=scontent.fbkk5-5.fna&tp=6&oh=2b32ea64944e31d53514b31ac736a0ff&oe=6075D706'),
          BuildQuote('Fear ain\'t great thing we should do.','-jirayuwat3','https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-1/p160x160/31890355_2021595088099610_8172370960880500736_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHud3uhBAyPQMQ7vdtB1iYQEoIeT-bek6ESgh5P5t6ToeoUunnJH_0_KmaIjLj4mH3000iEuhk8PKagQY-6FZeJ&_nc_ohc=kBeua-Pk8UAAX-7hrqd&_nc_ht=scontent.fbkk5-5.fna&tp=6&oh=2b32ea64944e31d53514b31ac736a0ff&oe=6075D706'),
          BuildQuote('Fear ain\'t great thing we should do.','-jirayuwat4','https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-1/p160x160/31890355_2021595088099610_8172370960880500736_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHud3uhBAyPQMQ7vdtB1iYQEoIeT-bek6ESgh5P5t6ToeoUunnJH_0_KmaIjLj4mH3000iEuhk8PKagQY-6FZeJ&_nc_ohc=kBeua-Pk8UAAX-7hrqd&_nc_ht=scontent.fbkk5-5.fna&tp=6&oh=2b32ea64944e31d53514b31ac736a0ff&oe=6075D706'),
          BuildQuote('Fear ain\'t great thing we should do.','-jirayuwat5','https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-1/p160x160/31890355_2021595088099610_8172370960880500736_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHud3uhBAyPQMQ7vdtB1iYQEoIeT-bek6ESgh5P5t6ToeoUunnJH_0_KmaIjLj4mH3000iEuhk8PKagQY-6FZeJ&_nc_ohc=kBeua-Pk8UAAX-7hrqd&_nc_ht=scontent.fbkk5-5.fna&tp=6&oh=2b32ea64944e31d53514b31ac736a0ff&oe=6075D706'),
        ],
      ),
    );
  }
}

class BuildQuote extends StatelessWidget {
  final String _author;
  final String _quote;
  final String _picture;
  const BuildQuote(this._quote,this._author,this._picture,{
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 10,
      child: Column(
        children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(this._picture),
                ),
              ),
            ),
            Container(
              alignment: Alignment(-1, 0),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this._quote,
                style: TextStyle(
                  fontSize :18,
                ),
              ),
            ),
            Container(
              alignment: Alignment(1, 0),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this._author,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}