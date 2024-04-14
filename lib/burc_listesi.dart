
import 'package:burclar/burc_item.dart';
import 'package:burclar/data/strings.dart';
import 'package:burclar/model/burc.dart';
import 'package:flutter/material.dart';



class BurcListesi extends StatelessWidget {
   late  List<Burc> tumBurclar;
   BurcListesi(){
    tumBurclar = veriKaynaginiHazirla();
    } 
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burç Listesi",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Theme.of(context).primaryColor,
      ),body:  Center(
      child: ListView.builder(itemBuilder: (context,index){
        return BurcItem(listenenBurc: tumBurclar[index]);
      },itemCount: tumBurclar.length,)
      ),
    );
  }
  
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for(int i = 0;i<12;i++){
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim = Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var burckBuyukResim = Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenecekBurc = Burc(burcAdi,burcTarih,burcDetay,burcKucukResim,burckBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}