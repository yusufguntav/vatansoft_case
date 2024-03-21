import 'package:flutter/material.dart';
import 'package:vatansoft_case/app/common/widgets/custom_text.dart';
import 'package:vatansoft_case/core/variables/enums.dart';
import 'package:vatansoft_case/core/variables/standartMeasurementUnits.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, this.appbarTitle, this.customAppBar, required this.content, this.showAppBar = false, this.scrollController});
  final List<Widget> content;
  final String? appbarTitle;
  final bool showAppBar;
  final ScrollController? scrollController;
  final AppBar? customAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? customAppBar ??
              AppBar(
                  centerTitle: true,
                  title:
                      CustomText.extraHigh(appbarTitle ?? "", fontFamily: CustomFonts.rickAndMorty.font, textColor: Colors.white))
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.all(StandartMeasurementUnits.normalPadding),
            child: Center(child: Column(children: content)),
          ),
        ),
      ),
    );
  }
}
