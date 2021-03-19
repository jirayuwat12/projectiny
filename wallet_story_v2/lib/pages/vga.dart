import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_store/flutter_cache_store.dart';
import 'dart:convert';

import 'package:wallet_story_v2/pages/vga_detail.dart';
import 'package:wallet_story_v2/models/vga.dart';
import 'package:wallet_story_v2/pages/vga_filter.dart';
import 'package:wallet_story_v2/pages/vga_filter.dart';

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Builder.',
      home: VgaPage(),
    );
  }
}

class VgaPage extends StatefulWidget {
  @override
  _VgaPageState createState() => _VgaPageState();
}

class _VgaPageState extends State<VgaPage> {
  List<Vga> allVgas = [];
  List<Vga> filteredVgas = [];
  
  String sortby = 'latest';
  BuildContext _scaffoldContext;
  VgaFilter vgafilter = VgaFilter();

  sortAction( ){
    setState(() {
      if(sortby == 'latest'){
        sortby = 'low to hight';
        filteredVgas.sort((a,b){
          return a.vgaPriceAdv - b.vgaPriceAdv;
        });
      }else if(sortby == 'low to hight'){
        sortby = 'hight to low';
        filteredVgas.sort((a,b){
          return b.vgaPriceAdv - a.vgaPriceAdv;
        });
      }else{
        sortby = 'latest';
        filteredVgas.sort((a,b){
          return b.id-a.id;
        });
      }
    });

  }
  
  showMessage(String message){
    Scaffold.of(_scaffoldContext).showSnackBar(
      SnackBar(
        content: Text('Sort by ' +message),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
    filterAction();
  }

  void loadData() async{
    final store = await CacheStore.getInstance();
    final file = await store.getFile('https://www.advice.co.th/pc/get_comp/vga');
    final jsonString = json.decode(file.readAsStringSync());
    setState(() {
      jsonString.forEach((v){
          final vga = Vga.fromJson(v);
          if(vga.advId != '' && vga.vgaPriceAdv != 0) allVgas.add(vga);
        }
      );
    });
    //print(file.readAsStringSync());
  }

  filterAction( ){
    setState(() {
      vgafilter.allBrands = allVgas.map((e) => e.vgaBrand).toSet();
      //vgafilter.selectedBrands = allVgas.map((e) => e.vgaBrand).toSet();
      // vgafilter.selectedBrands.remove('GIGABYTE');  
      filteredVgas.clear();
      allVgas.forEach((element) {
        if(vgafilter.selectedBrands.contains(element.vgaBrand))
          filteredVgas.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title :Text('PC Builder'),
        actions: [
          
          IconButton(
            icon: Icon(Icons.tune),
            tooltip: 'Filter',
            onPressed: ( ){
              navigate2filterPage(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            tooltip: 'Sort',
            onPressed: (){
              sortAction();
              showMessage(sortby);
            },
          ),
        ],
      ),
      body: Builder(builder:(context){
        _scaffoldContext = context;
        return bodyBuilder();
      }),
    );
  }

  navigate2filterPage(BuildContext context) async{
    //vgafilter.vgaBrands = ['ASUS'];
    VgaFilter result = await Navigator.push(context,MaterialPageRoute(
      builder: (context) => VgaFilterPage(
        vgaFilter: vgafilter,
      )
    ));
    if(result.selectedBrands != null){
      vgafilter.selectedBrands = result.selectedBrands;
      filterAction();
    }
  }

  Widget bodyBuilder() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.builder(
        itemCount: filteredVgas.length,
        itemBuilder: (BuildContext context,int i){
          return Card(
            elevation: 0,
            child: Container(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VgaDetailPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: 'https://www.advice.co.th/pic-pc/vga/' +filteredVgas[i].vgaPicture,
                      ),
                    ),
                    Column(
                      children: [
                        Text('${filteredVgas[i].vgaModel}'),
                        Text('${filteredVgas[i].vgaBrand}'),
                        Text('${filteredVgas[i].vgaPriceAdv} Bath'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

