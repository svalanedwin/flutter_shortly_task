import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shorlty_task/controllers/introduction_view_controller.dart';
import 'package:flutter_shorlty_task/routes/app_routes.dart';
import 'package:flutter_shorlty_task/views/indroduction_view/widgets/introduction_card_widget.dart';
import 'package:flutter_shorlty_task/views/indroduction_view/widgets/page_step_pointer_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/helpers/shared.dart';

class IntroductionView extends GetView<IntroductionViewController>{
  const IntroductionView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.cyanBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: dimen.heightFactor * 2),
          child: Column(
            children: [
              SvgPicture.asset(assets.logoSvg),
              Expanded(
                  flex: 8,
                  child: PageView.builder(
                      itemCount: controller.introductionList.length,
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (BuildContext context,int index) =>Center(
                        child: IntroductionCardWidget(
                          svgUrl: controller.introductionList[index].svgUrl,
                          title: controller.introductionList[index].title,
                          description: controller.introductionList[index].description,
                        ),
                      ),
                  ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.introductionList.length,
                      itemBuilder: (BuildContext context,int index) => Obx(
                          () => PageStepPointerWidget(
                              contentColor: controller.activeIntroductionCardIndex.isEqual(index)
                                ?Colors.grey
                                :Colors.transparent,
                              borderColor: Colors.grey,
                          ),
                      ),
                  ),
              ),
              TextButton(
                  onPressed: () => Get.offNamed(AppRoutes.shortenView),
                  child: Text(
                    localization.skip.tr,
                    style: Get.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 18),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

}