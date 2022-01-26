import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../config.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<HomeScreenController>(
      create: (BuildContext context) => HomeScreenController(),
      child: Scaffold(
        body: Container(
          color: mainColorLight,
          child: Center(
            child: Consumer<HomeScreenController>(
              builder: (context, provider, child) {
                return provider.countries != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Flag.fromString(
                            provider.initialCountry!.iso1,
                            borderRadius: 10,
                            fit: BoxFit.fill,
                            height: width * 0.15,
                            width: width * 0.2,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: Size(width * 0.5, width * 0.15),
                              primary: Colors.white,
                            ),
                            child: FittedBox(
                              child: Text(
                                provider.initialCountry!.name,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onPressed: provider.showCoutriesDialog,
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                        ],
                      )
                    : SpinKitFadingCircle(
                        color: Colors.black.withOpacity(0.5),
                        size: MediaQuery.of(context).size.width * 0.1,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
