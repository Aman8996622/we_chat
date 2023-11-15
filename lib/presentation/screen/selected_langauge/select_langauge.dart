import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/app__localization/app_localization.dart';
import 'package:we_chat/presentation/screen/selected_langauge/langauge_controller.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<String> listLangauge = [
    "English",
    "Hindi",
  ];

  @override
  Widget build(BuildContext context) {
    var langaugeController =
        Provider.of<LangaugeController>(context, listen: true);

  return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Consu(
            //   child: Container(
            //     child: Text(AppLocalizations.of(context)?.enterPhone ?? ""),
            //   ),
            // ),
            Consumer<LangaugeController>(
              builder: (context, value, child) {
                return Container(
                  height: 40,
                  color: Colors.amber,
                  child: Text(
                      AppLocalizations.of(context)?.tranlate("enter_phone") ??
                          ""),
                );
              },
            ),

            Consumer<LangaugeController>(
              builder:   (context, value, child) {
                  return Center(
                child: Container(
                  child: DropdownButton<String>(
                    value: value.selectValue,
                    items: listLangauge.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      langaugeController.changeLocale(value);
                    },
                  ),
                ),
              ); 
              },
            )
          ],
        ),
      ),
    );
  }
}
