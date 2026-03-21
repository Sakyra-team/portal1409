import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal1409/features/home/services/cubit/service_cubit.dart';
import 'package:portal1409/repository/service/service_repository_abstract.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _baseName = "favorite";

class ServiceRepository implements ServiceRepositoryAbstract {
  ServiceRepository({required this.prefs});
  final SharedPreferences prefs;

  @override
  Future<void> saveFavorite(int id) async {
    final List<String>? listOfFavorite = prefs.getStringList(_baseName);
    listOfFavorite?.add(id.toString());
    await prefs.setStringList(_baseName, listOfFavorite ?? [id.toString()]);
  }

  @override
  List<String>? getFavorite() {
    return prefs.getStringList(_baseName);
  }

  @override
  Future<void> removeFavorite(int id) async {
    final List<String>? listOfFavorite = prefs.getStringList(_baseName);
    if (listOfFavorite != null) {
      listOfFavorite.remove(id.toString());
      if (listOfFavorite.isEmpty) {
        await prefs.remove(_baseName);
      } else {
        await prefs.setStringList(_baseName, listOfFavorite);
      }
    } else {
      await prefs.remove(_baseName);
    }
  }

  @override
  Future<void> removeAllFavorite() async {
    await prefs.remove(_baseName);
  }
}
