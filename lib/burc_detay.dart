import 'package:burclar/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.pink;
  late PaletteGenerator _generator;

 
 @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            iconTheme: const IconThemeData(color: Colors.white,size: 35),
            flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi+" Burcu Tanımı",style: const TextStyle(
              fontWeight: FontWeight.bold
            ),),
              background: Image.asset("images/${widget.secilenBurc.burcBuyukResim}",fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(6),
                  child: SingleChildScrollView(
                    child: Text(widget.secilenBurc.burcDetayi,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                  ),
                ),
               ListTile(
                leading: Icon(Icons.arrow_forward,color: appBarRengi,size: 25,),
                title: Text("Yazılım Guncesi Tarafından Oluşturulmuştur ...",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                )),
               )
              ],
            ),
            
          )
        ],
      )
    );
  }
  
  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appBarRengi = _generator.dominantColor!.color;
        setState(() {
      
    });

  }
}