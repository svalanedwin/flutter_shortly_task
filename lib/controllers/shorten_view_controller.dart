import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shorlty_task/models/shorten_model.dart';
import 'package:flutter_shorlty_task/services/api_service.dart';
import 'package:get/get.dart';

import '../models/history_model.dart';
import '../utils/helpers/shared.dart';

class ShortenViewController extends GetxController {
  late final TextEditingController textFieldController;
  late final RxBool _flag, _isLoading;
  late final RxString _enteredUrl;
  late final RxList _shortenResponse;
  late final RxList<HistoryModel> copiedList;
  late final RxList<HistoryModel> historyList;

  String get enteredUrl => _enteredUrl.value;
  bool get flag => _flag.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit(){
    _flag = false.obs;
    _isLoading = false.obs;
    _enteredUrl = ''.obs;
    _shortenResponse = [].obs;

    historyList = <HistoryModel>[].obs;
    copiedList = <HistoryModel>[].obs;
    textFieldController = TextEditingController();
    historyList.value = shared.getHistoryList();
    super.onInit();
  }
  void onChanged([String? value]){
    _flag.value = value?.isEmpty ?? true;
    update();
  }
  void validFunction(){
    _enteredUrl.value = textFieldController.text;
    _flag.value = _enteredUrl.isEmpty;
    if(historyList
        .where((item) => item.lastUrl == _enteredUrl.value)
        .isNotEmpty){
      showSnackbar(localization.linkAlreadyAdded.tr);
      update();
      return;
    }
    if(_enteredUrl.value.contains(
      RegExp(
        apiConstants.baseUrl,
        caseSensitive:false,
        multiLine:true,
      ),
    )){
      showSnackbar(localization.notValidText.tr);
      update();
      return;
    }
    final isValid = Uri.tryParse(textFieldController.text)!.isAbsolute;
    if(isValid && _enteredUrl.isNotEmpty){
      update();
      getData(textFieldController.text);
      return;
    }else if(!isValid && _enteredUrl.isNotEmpty){
      showSnackbar(localization.notValidText.tr);
    }
    update();
  }
  Future getData(String data) async{
    FocusManager.instance.primaryFocus?.unfocus();
    _shortenResponse.clear();
    try{
      _isLoading.value = true;
      final jsonData = await ApiService().getData(data);
      _shortenResponse.add(ShortenModel.fromJson(jsonData));

      await addData(
        HistoryModel(
            lastUrl: textFieldController.text,
            shortenUrl: _shortenResponse[0].result.fullShortLink,
        ),
      );
    }catch(e){
      await Get.defaultDialog(title: 'Alert', middleText: e.toString());
    }
    _isLoading.value = false;
    update();
  }
  Future<void> addData(HistoryModel historyModel) async{
    historyList.insert(0, historyModel);
    await shared.setHistoryList(historyList);
    clearText();
  }
  void clearText(){
    textFieldController.text ='';
    onChanged();
  }
  Future<void> removeData(HistoryModel historyModel) async{
    historyList.removeWhere((item) => item.hashCode == historyModel.hashCode);
    copiedList.removeWhere((item) => item.hashCode == historyModel.hashCode);
    await shared.setHistoryList(historyList);
    update();
  }
  Future<void> copyClipboard(HistoryModel historyModel) async{
    await FlutterClipboard.copy(historyModel.shortenUrl);
    copiedList.add(historyModel);
    update();
  }
  bool isCopied(HistoryModel historyModel){
    return copiedList
        .where((item) => item.hashCode == historyModel.hashCode)
        .isNotEmpty;
  }
}
