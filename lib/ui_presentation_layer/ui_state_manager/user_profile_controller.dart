import 'package:ecommerce_app_cbay/data/model/profile_model.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/user_details_info_Screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/screens/user_profile_screen.dart';
import 'package:ecommerce_app_cbay/ui_presentation_layer/ui_state_manager/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/model/response_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    ResponseModel profileDataResponse =
        await NetworkCaller.getRequest(url: Urls.userReadProfileUrl);
    //This controller need token in its header. So, don't forget to pass token with network call.
    _getProfileDataInProgress = false;

    if (profileDataResponse.isSuccess) {
      //  save the data to shared preference(for long term use) and in auth controller class(for short term use).
      //   Save if the data came from the api is not null. And for that, call save method from auth_controller.
      //  if null, don't save. go to complete profile page to collect the data from user.
      ProfileModel profileModel =
          ProfileModel.fromJson(profileDataResponse.bodyData);
      if (profileModel.data != null) {
        Get.find<AuthController>().saveProfileDataInStorage(
            //profileDataResponse.bodyData
            //can't work with that raw bodyData. we nee to convert it to ProfileModel first.
            profileModel.data!.first);
      } else {
        Get.to(() => const UserDetailInfoScreen());
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
