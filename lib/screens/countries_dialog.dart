import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:lovester_test/config.dart';
import '../controllers/home_screen_controller.dart';

class CountriesDialog extends StatelessWidget {
  final HomeScreenController controller;
  const CountriesDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        color: mainColor.withOpacity(0.5),
        child: ListView(
          children: controller.countries!
              .map(
                (country) => ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleFlag(
                    country.iso1,
                    size: width * 0.15,
                  ),
                  title: Container(
                    color: Colors.white,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          country.name,
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () => controller.selectCountry(country),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
