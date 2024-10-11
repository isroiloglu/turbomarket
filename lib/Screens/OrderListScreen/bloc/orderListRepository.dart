import '../../../Helper/storageHelper.dart';
import '../../../Models/OrderListModel/order_model.dart';
import '../../../Models/OrderReorderModel/Request/reorder_request.dart';
import '../../../Models/OrderReorderModel/Response/reorder_response.dart';
import '../../../NetworkManager/api_client.dart';

abstract class OrderListRepository{
  Future<OrderModel> getCustomerOrders(int page);
  Future<ReorderResponse> reorder(ReorderRequest request);
}
class OrderListRepositoryImp implements OrderListRepository {

  @override
  Future<OrderModel> getCustomerOrders(int page) async {
    OrderModel? orderListModel;
    orderListModel=await ApiClient(baseUrl:(storageController.getStoreData()?.url!)).getCustomerOrders((storageController.getUserData()?.userId??'').toString(),page,storageController.getCurrentLanguage()
        ,storageController.getCurrentCurrency(),
        storageController.getStoreData()!.storefrontId.toString()
    );

    return orderListModel;
  }



  @override
  Future<ReorderResponse> reorder(ReorderRequest req) async{
    ReorderResponse reorderResponse;
    reorderResponse = await ApiClient().getReOrderDetails(req.toJson());
    return reorderResponse;
  }


}