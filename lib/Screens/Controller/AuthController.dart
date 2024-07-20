import '../../config/import.dart';

class Authctrl extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conPassword = TextEditingController();

  signup(cntx) async {
    var result = await FirebaseAuthfunction()
        .reistertofirebase(email.text, password.text);
    // if (result == true) {
    await FirebaseCrud().insertIntoCollection(
        collectionname: FirebaseCollectionname.user,
        jsondata: {
          "username": username.text,
          "email": email.text,
          "password": password.text
        });

    // Navigator.of(cntx).pushNamed(AppRoutes.home);
    print("Added successfully");
    // }
  }
}

