
import 'package:world_miral_cs_cart_multivendor_flutter_app/Models/AccountModels/Request/updateProfileRequest.dart';

import '../Constants/appConstants.dart';
import '../Models/CheckoutModels/GuestCheckout/Request/guestUserData.dart';
import '../Models/CheckoutModels/GuestCheckout/Request/submitDataRequest.dart';
import '../Models/HomePageModels/home_screen_models.dart';
import '../Models/MultipleProfilesModel/profileUserModel.dart';
import '../Models/ShippingModel/Response/ShippingMethodsModel/shippingStoreModel.dart';

class GlobalData{
static bool isFirstTime = true;
 static int selectedIndex=0;
 static HomeScreenModels? homeScreenModels;
 static String filterHash="";
 static double imageSize=(AppSizes.width / 2.5) - AppSizes.linePadding;
 static String tempPassword="";
 static UpdateProfileRequest updateProfileRequest=UpdateProfileRequest.empty();
 static ProfileUserModel? selectedProfileForCheckout;
 static GuestUserData guestUserData=GuestUserData.empty();

 static String selectedStore="";
 static int shipToAnother= 0 ;

 static String searchFilterHash="";


}