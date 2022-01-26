import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:lovester_test/config.dart';
import 'package:lovester_test/models/country.dart';
import '../controllers/home_screen_controller.dart';

class CountriesDialog extends StatefulWidget {
  final HomeScreenController controller;
  const CountriesDialog({Key? key, required this.controller}) : super(key: key);

  @override
  State<CountriesDialog> createState() => _CountriesDialogState();
}

class _CountriesDialogState extends State<CountriesDialog> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Widget> _countriesTile = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addCountries();
    });
  }

  void _addCountries() {
    Future ft = Future(() {});
    widget.controller.countries!.forEach((country) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          _countriesTile.add(_buildCountry(country));
          if (_listKey.currentState != null) {
            _listKey.currentState!.insertItem(_countriesTile.length - 1);
          }
        });
      });
    });
  }

  Widget _buildCountry(Country country) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: CircleFlag(
        country.iso1,
        size: 50,
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
      onTap: () => widget.controller.selectCountry(country),
    );
  }

  final Tween<Offset> _offset = Tween(
    begin: Offset(0, 1),
    end: Offset(0, 0),
  );

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
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _countriesTile.length,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: animation.drive(_offset),
              child: _countriesTile[index],
            );
          },
        ),
      ),
    );
  }
}
