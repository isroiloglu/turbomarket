import '../../../Constants/appConstants.dart';
import '../../../Helper/storageHelper.dart';
import '../../../Models/NotificationModel/notification_list_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class NotificationsScreenRepository {
  Future<List<NotificationResponse>> getNotificationsPageData();
}

class NotificationsScreenRepositoryImp implements NotificationsScreenRepository {
  @override
  Future<List<NotificationResponse>> getNotificationsPageData() async {
    return await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getNotificationData(ApiConstant.authToken,storageController.getCurrentLanguage(),storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString());
  }

}