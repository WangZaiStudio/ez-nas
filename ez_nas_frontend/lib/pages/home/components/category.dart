import 'package:flutter/material.dart';
import '../../../l10n/gen/app_localizations.dart';
import 'button.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Images.png',
              text: localizations.homeCategoryImage,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Videos.png',
              text: localizations.homeCategoryVideo,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Documents.png',
              text: localizations.homeCategoryDocument,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
