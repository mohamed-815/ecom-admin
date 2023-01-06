import 'package:adminside/app_module/const/const.dart';
import 'package:flutter/material.dart';

class CartHeading extends StatelessWidget {
  CartHeading({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: const TextStyle(
          color: kwhite, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class CartHeadingbblack extends StatelessWidget {
  CartHeadingbblack({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class CartHeading1 extends StatelessWidget {
  CartHeading1({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kwhite,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ItemListHeading extends StatelessWidget {
  ItemListHeading({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kwhite, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class ItemListHeadingnewfont extends StatelessWidget {
  ItemListHeadingnewfont({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
          color: kwhite,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'abril fatface'),
    );
  }
}

class Textwidgrt extends StatelessWidget {
  Textwidgrt({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class Textwidgrtblack extends StatelessWidget {
  Textwidgrtblack({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class Textwidgetwhite extends StatelessWidget {
  Textwidgetwhite({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class Textwidgrt1 extends StatelessWidget {
  Textwidgrt1({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
        color: Color.fromARGB(255, 168, 165, 165),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class SettingText extends StatelessWidget {
  SettingText({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style:
          TextStyle(color: kblack, fontSize: 30, fontWeight: FontWeight.w500),
    );
  }
}

class smalltextboldWidjets extends StatelessWidget {
  smalltextboldWidjets({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 248, 245, 245)),
    );
  }
}

class smalltextboldWidjetsblack extends StatelessWidget {
  smalltextboldWidjetsblack({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 8, 8, 8),
          fontSize: 17),
    );
  }
}

class smalltextboldWidjets9 extends StatelessWidget {
  smalltextboldWidjets9({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}

class smalltextboldWidjets25 extends StatelessWidget {
  smalltextboldWidjets25({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: kwhite,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class smalltextboldWidjets25black extends StatelessWidget {
  smalltextboldWidjets25black({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: kwhite,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class TextOnly25 extends StatelessWidget {
  TextOnly25({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    );
  }
}

class TextOnly5 extends StatelessWidget {
  TextOnly5({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(
        color: Color.fromARGB(255, 237, 234, 234),
        fontSize: 25,
      ),
    );
  }
}

class TextItemShowName extends StatelessWidget {
  TextItemShowName({Key? key, required this.title1}) : super(key: key);

  String title1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title1,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(
        color: Color.fromARGB(255, 237, 234, 234),
        fontSize: 25,
      ),
    );
  }
}
