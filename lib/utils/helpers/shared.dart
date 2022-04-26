
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shorlty_task/constants/asset_constants.dart';
import 'package:flutter_shorlty_task/constants/shared_prefs_constants.dart';
import 'package:flutter_shorlty_task/services/pref_service.dart';
import 'package:flutter_shorlty_task/utils/helpers/dimen.dart';
import 'package:get/get.dart';

import '../../constants/api_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/locale_key_constants.dart';

part 'shared_functions.dart';
final _colors = ColorConstants();
final _dimen = Dimen();
final _assets = AssetConstants();
final _shared = Get.find<SharedPrefService>();
final _sharedKeys = SharedPrefsConstants();
final _localization = LocaleKeyConstants();
final _apiConstants = ApiBaseConstants();
ColorConstants get colors => _colors;
Dimen get dimen => _dimen;
AssetConstants get assets => _assets;
SharedPrefService get shared => _shared;
SharedPrefsConstants get sharedKeys => _sharedKeys;
LocaleKeyConstants get localization => _localization;
ApiBaseConstants get apiConstants => _apiConstants;