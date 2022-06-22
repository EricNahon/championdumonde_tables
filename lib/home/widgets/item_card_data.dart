import 'package:flutter/material.dart';
import '../../core/locator.dart';

class ItemCardData {
  const ItemCardData({
    required this.imageName,
    required this.title,
    required this.description,
    required this.tags,
    required this.onClicked,
  });

  final String imageName;
  final String title;
  final String description;
  final List<String> tags;
  final Function(BuildContext) onClicked;

  static final allItemsData = [
    ItemCardData(
      imageName: '',
      title: 'Les tables de multiplications',
      description: "Fais tourner la roulette des multiplications et gagne des pièces d'or à chaque bonne réponse !",
      tags: ['CE1/CE2', 'Calcul'],
      onClicked: (BuildContext context) {
        appController.launchInBrowser(Uri.parse('https://lestables.cfacile.app'));
      },
    ),
  ];
}
