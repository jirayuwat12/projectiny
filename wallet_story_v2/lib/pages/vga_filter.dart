import 'package:flutter/material.dart';

import 'package:wallet_story_v2/models/vga.dart';

class VgaFilterPage extends StatefulWidget {
  final VgaFilter vgaFilter;

  VgaFilterPage({Key key,this.vgaFilter}):super(key:key);

  @override
  _VgaFilterPageState createState() => _VgaFilterPageState();
}

class _VgaFilterPageState extends State<VgaFilterPage> {
  VgaFilter filter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filter = widget.vgaFilter;
  }
  @override
  Widget build(BuildContext context) {
    List<String> allbrandList = filter.allBrands.toList()..sort( );
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter page'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            tooltip: 'OK',
            onPressed: () {
              Navigator.pop(context,filter);
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title:Text('Brands'),
            trailing: allbrandList.length != filter.selectedBrands.length? 
            FlatButton(
              child: Text('Select all'),
              onPressed: (){
                setState(() {
                  allbrandList.forEach((element) {
                    filter.selectedBrands.add(element);
                  });
                });
              },
            ):
            FlatButton(
              child: Text('Deselect all'),
              onPressed: (){
                setState(() {
                  filter.selectedBrands.clear();
                });
              },
            )
          ),
          Wrap(
            children:allbrandList.map((e) => filterChipMaker(e)).toList()
          )
        ]
      ),
    );
  }

  Padding filterChipMaker(String e){
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: FilterChip(
        avatar: Text(''),
        label: Text(e),
        selected: filter.selectedBrands.contains(e),
        onSelected: (bool b){
          setState(() {
            if(b) filter.selectedBrands.add(e);
            else  filter.selectedBrands.remove(e);
          });
        }
      ),
    );
  }
}