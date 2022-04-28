import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:rehnuma/constants.dart';

class ChooseAvatar extends StatefulWidget {
  void saveDp() {
     var dp =  FluttermojiController().setFluttermoji();
  }

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          FluttermojiCircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff34a855),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 17.0,
                    ),
                  ),
                  label: Text(
                    'Customize',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff34a855),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36.0,
                      vertical: 17.0,
                    ),
                  ),
                  label: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    widget.saveDp();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    var isWeb = platform != TargetPlatform.android ||
        platform != TargetPlatform.iOS ||
        platform != TargetPlatform.fuchsia;

    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: FluttermojiCircleAvatar(
              radius: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 20.0,
            ),
            child: FluttermojiCustomizer(
              scaffoldHeight: 310,
              autosave: true,
              scaffoldWidth: isWeb ? 600 : 0,
            ),
          ),
        ],
      ),
    );
  }
}
