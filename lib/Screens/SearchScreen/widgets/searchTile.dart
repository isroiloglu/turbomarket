import 'package:flutter/material.dart';

import '../../../Constants/arguments_map.dart';
import '../../../Constants/routeConstant.dart';
import '../../../Models/HomePageModels/categories.dart';
import '../../CategoryScreen/Widgets/categoryTile.dart';

Widget searchTile(BuildContext context, List<Categories> categoryList,{bool isShowImage = true}){
  return ListView.separated(
    itemCount: categoryList.length ,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index){
      return categoryTile(
          context,
          categoryList[index].category ?? '',
          categoryList[index].images ?? '',
              (){
            if(categoryList[index].subcategoryList?.isNotEmpty ?? false){
              Navigator.pushNamed(context, subCategory, arguments: subCategoryDataMap(categoryList[index].categoryId ?? '', categoryList[index].category ?? ''));
            }
            else{
              Navigator.pushNamed(context, catalogPage,
                  arguments: getCatalogMap(categoryList[index].categoryId ?? '', "", categoryList[index].category ?? '', false));
            }
          },
          isShowImage
      );
    }, separatorBuilder: (BuildContext context, int index) {
    return Divider();
  },);
}