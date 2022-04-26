import 'package:flutter_shorlty_task/models/introduction_content_model.dart';
import 'package:flutter_shorlty_task/utils/helpers/shared.dart';
import 'package:get/get.dart';

class IntroductionViewController extends GetxController{
    final RxInt _activeIntroductionCardIndex =0.obs;
    int get activeIntroductionCardIndex => _activeIntroductionCardIndex.value;

    void onPageChanged(int value){
        _activeIntroductionCardIndex.value = value;
    }
  @override
  void onInit(){
      shared.setFirstLogin(false);
      super.onInit();
  }
 final List<IntroductionContentModel> introductionList = [
    IntroductionContentModel(
        title: localization.brandRecognitionTitle.tr,
        description: localization.brandRecognitionDescription.tr,
        svgUrl: assets.brushesSvg,
    ),
   IntroductionContentModel(
     title: localization.detailedRecordTitle.tr,
     description: localization.detailedRecordDescription.tr,
     svgUrl: assets.brushesSvg,
   ),
   IntroductionContentModel(
     title: localization.fullyCustomizableTitle,
     description: localization.fullyCustomizableDescription,
     svgUrl: assets.brushesSvg,
   )
 ];
}