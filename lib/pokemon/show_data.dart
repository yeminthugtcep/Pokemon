import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/detail_page.dart';
import 'package:pokemon/pokemon/utils/const.dart';
import 'package:pokemon/pokemon/modal_object/dart_object.dart';

class ShowData extends StatelessWidget {
  DartObjectPage dob;
  ShowData(this.dob);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(dob);
        }));
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: IMG_URL + dob.variations![0].image.toString(),
                child: Image.network(
                  IMG_URL + dob.variations![0].image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(dob.variations![0].name.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
