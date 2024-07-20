import '../config/import.dart';

class ElevatedButtons extends StatefulWidget {
  final String name;
  final Function? onTap;
  final width;
  final double height;
  final style;
  final colorbtn;
  final bool active;
  final double borderRadius;

  final double elevation;

  final bordercolor;

  final showon;

  final bool loading;

  ElevatedButtons(
      {Key? key,
      required this.name,
      this.onTap,
      this.width = 0.9,
      this.style,
      this.colorbtn,
      this.active = false,
      this.borderRadius = 30,
      this.height = 50,
      this.elevation = 5,
      this.bordercolor,
      this.showon = true,
      this.loading = false})
      : super(key: key);

  @override
  State<ElevatedButtons> createState() => _ElevatedButtonsState();
}

class _ElevatedButtonsState extends State<ElevatedButtons> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widget.width,
      height: widget.height,
      child: ElevatedButton(
        child: widget.loading
            ? Center(
                child: CircularProgressIndicator(
                color: Mycolor().whitecolor,
              ))
            : Text(
                widget.name,
                style: TextStyle(fontSize: 16, color: Mycolor().whitecolor),
              ),
        onPressed: () {
          widget.onTap!();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: new RoundedRectangleBorder(
            side: widget.active
                ? BorderSide(color: widget.bordercolor)
                : BorderSide(color: Colors.transparent),
            borderRadius: new BorderRadius.circular(widget.borderRadius),
          ),
          primary: widget.colorbtn,
          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
      ),
    );
  }
}
