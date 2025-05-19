import 'package:flutter/material.dart';
import 'package:my_notes/data/models/item_drawer_model.dart';

List<ItemDrawerModel> drawerItems = [
  ItemDrawerModel(title: "Home", iconCategory: Icons.home),
  ItemDrawerModel(title: "Profile", iconCategory: Icons.person),
  ItemDrawerModel(
    title: "archives",
    iconCategory: Icons.file_download_outlined,
  ),
  ItemDrawerModel(title: "Trash", iconCategory: Icons.delete),
  ItemDrawerModel(title: "Settings", iconCategory: Icons.settings),
];
