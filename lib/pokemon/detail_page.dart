import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/modal_object/dart_object.dart';
import 'package:pokemon/pokemon/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  DartObjectPage dob;
  DetailPage(this.dob);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(dob.name.toString()),
        centerTitle: true,
      ),
      body: ListView(children: [
        Card(
          child: Hero(
            tag: IMG_URL + dob.variations![0].image.toString(),
            child: Image.network(
              IMG_URL + dob.variations![0].image.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Description : ${dob.variations![0].description.toString()}"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("Types : ${dob.variations![0].types.toString()} ,"),
              ),
              Text("Abilities : ${dob.variations![0].abilities.toString()} ,"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                    "Evolutions : ${dob.variations![0].evolutions.toString()} ,"),
              ),
              const SizedBox(
                height: 70,
              ),
              Card(
                child: ListTile(
                    onTap: () async {
                      // await launch(dob.link.toString());
                      await launchUrl(Uri.parse(dob.link.toString()));
                    },
                    title: Center(child: Text(dob.link.toString()))),
              ),
            ],
          ),
        )
        // Row(
        //   children: [
        //     const SizedBox(
        //       height: 100,
        //       child: Text("Description : "),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 100,
        //         child: Expanded(
        //           child: Text(
        //             dob.variations![0].description.toString(),
        //             maxLines: 5,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: [
        //     const SizedBox(
        //       height: 40,
        //       child: Text("Types : "),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 40,
        //         child: Expanded(
        //           child: Text(
        //             dob.variations![0].types.toString(),
        //             maxLines: 3,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ]),
    );
  }
}
