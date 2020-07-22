import "package:cloud_firestore/cloud_firestore.dart";

class CrudMethods{
 getData() async {
    return await Firestore.instance.collection("bike").orderBy("time").snapshots();
  }
   getelectronicData() async {
    return await Firestore.instance.collection("electronic").orderBy("time").snapshots();
  }
   getPhoneData() async {
    return await Firestore.instance.collection("phone").orderBy("time").snapshots();
  }

}