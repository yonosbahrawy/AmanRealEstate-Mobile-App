import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyManagement {
  //Read data for main Page
  static Stream<QuerySnapshot> allProperties() {
    return FirebaseFirestore.instance.collection('properties').snapshots();
  }

  static Stream<QuerySnapshot> searchedProperties(String coming) {
    return FirebaseFirestore.instance
        .collection('properties')
        .where("unitName", isGreaterThanOrEqualTo: coming)
        .snapshots();
  }

  static Query<Map<String, dynamic>> roomFilter(
      CollectionReference<Map<String, dynamic>> properties, String roomFilter) {
    if (roomFilter == "Any") {
      return properties.where("noRooms", isNotEqualTo: "");
    }
    return properties.where("noRooms", isEqualTo: roomFilter);
  }

  static Query<Map<String, dynamic>> bathroomFilter(
      CollectionReference<Map<String, dynamic>> properties,
      String bathroomFilter) {
    if (bathroomFilter == "Any") {
      return properties.where("noBathrooms", isNotEqualTo: "");
    }
    return properties.where("noBathrooms", isEqualTo: bathroomFilter);
  }

  static Query<Map<String, dynamic>> typeFilter(
      CollectionReference<Map<String, dynamic>> properties, String typeFilter) {
    return properties.where("type", isEqualTo: typeFilter);
  }

  static Query<Map<String, dynamic>> priceRangeFilter(
      CollectionReference<Map<String, dynamic>> properties,
      RangeValues priceFilter) {
    return properties
        .where("price", isGreaterThanOrEqualTo: priceFilter.start)
        .where("price", isLessThanOrEqualTo: priceFilter.end);
  }

  static Future getFlatData(
      {required List<String> commonUnitPrpoerties,
      required String floor,
      required String doublex,
      required String noRooms,
      required String noBathrooms,
      required String finishing,
      required String furnished,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Flat"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'floor': floor,
      'doublex': doublex,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'noFloors': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getVillaData(
      {required List<String> commonUnitPrpoerties,
      required String noFloors,
      required String noRooms,
      required String noBathrooms,
      required String finishing,
      required String furnished,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Villa"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getBuildingData(
      {required List<String> commonUnitPrpoerties,
      required String noFloors,
      required String noFlats,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Building"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noFlats': noFlats,
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': ""
    });
  }

  static Future getClinicXStoreXLandXFactoryXOtherData(
      {required List<String> commonUnitPrpoerties,
      required String typeOFActivity,
      required String singleImage,
      required List<String> mutliImages,
      required String type}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'noAB': ""
    });
  }

  static Future getFarmData(
      {required List<String> commonUnitPrpoerties,
      required String typeOFActivity,
      required String noAB,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Farm"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noAB': noAB,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
    });
  }
}
