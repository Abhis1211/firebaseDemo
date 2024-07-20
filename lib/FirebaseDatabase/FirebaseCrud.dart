import '../config/import.dart';

class FirebaseCrud {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  insertIntoCollection({collectionname, jsondata}) async {
    try {
      print("-----insert--------");
      CollectionReference usersRef = await firestore.collection(collectionname);
      usersRef.add(jsondata).then((value) {
        Utils().toast(message: Strings.added);
       }).catchError((error) => Utils().toast(message: error.toString()));
    } catch (e) {
      print(e.toString());
    }
  }

  updateCollectiondata({docid, collectionname, jsondata}) {
    DocumentReference docRef = firestore.collection(collectionname).doc(docid);
    docRef
        .update(jsondata)
        .then((value) => Utils().toast(message: Strings.updated))
        .catchError((error) => Utils().toast(message: error.toString()));
  }
}
