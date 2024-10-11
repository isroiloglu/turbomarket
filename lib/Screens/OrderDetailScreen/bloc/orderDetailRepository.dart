
import 'package:world_miral_cs_cart_multivendor_flutter_app/NetworkManager/api_client.dart';

import '../../../Helper/storageHelper.dart';
import '../../../Models/OrderDetailModel/order_communication_model.dart';
import '../../../Models/OrderDetailModel/order_communication_msg_request.dart';
import '../../../Models/OrderDetailModel/order_details_model.dart';
import '../../../Models/OrderDetailModel/order_discussion_msg_model.dart';
import '../../../Models/OrderReorderModel/Request/reorder_request.dart';
import '../../../Models/OrderReorderModel/Response/reorder_response.dart';


abstract class OrderDetailBaseRepository {
  Future<OrderDetailsModel> getOrderDetails( String orderId);
  Future<OrderDiscussionMSGModel>sendOrderMsg( OrderCommunicationMSGRequest message);
  Future<OrderDiscussionMSGModel>sendOrderMsgLatest( OrderCommunicationMSGRequest message);
  Future<OrderCommunicationModel>orderDiscussion( String orderId);
  Future<OrderCommunicationModel>orderDiscussionLatest( String orderId);
  Future<ReorderResponse>reorder(ReorderRequest request);
}

class OrderDetailRepository implements OrderDetailBaseRepository {
  /*
  * to fetch particular  Order Details
  * */
  @override
  Future<OrderDetailsModel> getOrderDetails(String orderId) async {
    OrderDetailsModel? orderDetailsModel;
    orderDetailsModel = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getOrderDetails(orderId,storageController.getCurrentLanguage()
        ,storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString());
    return orderDetailsModel;
  }

  @override
  Future<OrderDiscussionMSGModel> sendOrderMsg(OrderCommunicationMSGRequest message) async{
    message.storefrontDd=storageController.getStoreData()?.storefrontId??"";
    return  await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).sendOrderDiscussionMsg(message.toJson());
  }
  @override
  Future<OrderDiscussionMSGModel> sendOrderMsgLatest(OrderCommunicationMSGRequest message) async{
    message.storefrontDd=storageController.getStoreData()?.storefrontId??"";
    return  await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).sendOrderDiscussionMsgLatest(message.toJson());
  }

  @override
  Future<OrderCommunicationModel> orderDiscussion(String orderId) async{
    return  await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).orderDiscussion(orderId, storageController.getCurrentLanguage(),
        storageController.getStoreData()!.storefrontId.toString());
  }
  @override
  Future<OrderCommunicationModel> orderDiscussionLatest(String orderId) async{
    return  await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).orderDiscussionLatest(orderId, storageController.getCurrentLanguage(),
        storageController.getStoreData()!.storefrontId.toString());
  }

  @override
  Future<ReorderResponse> reorder(ReorderRequest req) async{
    req.storefrontId=storageController.getStoreData()?.storefrontId??"";
    ReorderResponse reorderResponse;
    reorderResponse = await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getReOrderDetails(req.toJson());
    return reorderResponse;
  }
}