import 'package:flutter/material.dart';

main(){
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: StatefullHomepage(),
  );
  }
}
class StatefullHomepage extends StatefulWidget {
  @override
  _StatefullHomepageState createState() => _StatefullHomepageState();
}

class _StatefullHomepageState extends State<StatefullHomepage> {
  final _formkey = GlobalKey<FormState>();
  String _inputquote;
  String _inputauthor;
  List<Quote> quotes=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Quote'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Quote',
                  ),
                  onSaved: (String value){
                    _inputquote = value;
                    
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Author',
                  ),
                  onSaved: (String value){
                    _inputauthor = value;
                  },
                ),
                RaisedButton(
                  onPressed: (){
                    _formkey.currentState.save();
                    print("Quote :"+_inputquote +"\nAuthor :" +_inputauthor);
                    if(_inputauthor != "" && _inputquote !="") setState(() {
                      quotes.insert(0,Quote(_inputquote,_inputauthor));
                    });
                    _formkey.currentState.reset();
                  },
                  child: Text('Add')
                ),
              ],
            ),
          ),
          Expanded(
                      child: quotes.length == 0? 
              Center(
                child :Text('empty')
              ):
              ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (BuildContext context,int index){
                  return BuildQuote(quotes[index].text,quotes[index].author);
                },
              ),
          ),
        ],
      )
    );
  }
}

class Quote{
  final String text;
  final String author;
  Quote(this.text,this.author);
}
class BuildQuote extends StatelessWidget {
  final String _author;
  final String _quote;
  const BuildQuote(this._quote,this._author,{
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
              alignment: Alignment(0, 0),
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