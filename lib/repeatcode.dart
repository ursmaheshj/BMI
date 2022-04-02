import 'package:flutter/material.dart';
import 'constants.dart';

class TopCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TopCard({required this.topIcon, this.topTitle});

  final IconData topIcon;
  final String? topTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.all(10)),
        Icon(
          topIcon,
          size: MediaQuery.of(context).size.height * 0.12,
        ),
        Text(
          topTitle!,
          style: kTextSyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget RoundIconButton(IconData icon1, Function onPressed1) {
  return RawMaterialButton(
    elevation: 0.0,
    child: Icon(icon1),
    onPressed: () {
      onPressed1();
    },
    constraints: const BoxConstraints.tightFor(
      width: 55.0,
      height: 55.0,
    ),
    shape: const CircleBorder(),
    fillColor: const Color(0xFF4C4F5E),
  );
}
