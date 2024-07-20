


import '../../../Config/Import.dart';

class loginHeader extends StatelessWidget {
  const loginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.welcomeback.toString(),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(Strings.welcomeback.toString()),
      ],
    );
  }
}
 