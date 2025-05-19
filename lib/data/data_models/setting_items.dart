import 'package:flutter/material.dart';
import 'package:my_notes/data/models/item_settings_model.dart';
import 'package:my_notes/view/widgets/settings_widgets/switch_settings_widget.dart';

List<ItemSettingsModel> settingItems = [
  ItemSettingsModel(
    title: "2", // "Language"
    subTitle: "3", // "Choose Language For Your Favorite"
    icon: Icon(Icons.language, size: 25),
  ),
  ItemSettingsModel(
    title: "6", // "Mode"
    subTitle: "7", // "Turn On Dark Mode"
    icon: SwitchSettingsWidget(),
  ),
  ItemSettingsModel(
    title: "8", // "Download"
    subTitle: "9", // "Download Files From The Internet"
    icon: Icon(Icons.download, size: 25),
  ),
  ItemSettingsModel(
    title: "10", // "Upload"
    subTitle: "11", // "Upload File To The Internet"
    icon: Icon(Icons.upload, size: 25),
  ),
];
