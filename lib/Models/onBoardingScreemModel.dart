import 'package:flutter/cupertino.dart';

import '../Constants/appStringConstants.dart';
import '../Constants/imagesConstant.dart';

class SliderModel{
  String? logo;
  String? heading;
  String? image;
  String? description;


// Constructor for variables
  SliderModel({this.logo,this.heading, this.description, this.image,});

  void setImage(String getImage){
    image = getImage;
  }

  void setDescription(String getDescription){
    description = getDescription;
  }
  void setLogo(String getLogo){
    logo = getLogo;
  }
  void setLogoTitle(String getHeading){
    heading = getHeading;
  }

  String? getImage(){
    return image;
  }

  String? getDescription(){
    return description;
  }

  String? getLogo(){
    return logo;
  }

  String? getHeading(){
    return heading;
  }
}

// List created
List<SliderModel> getSlides(BuildContext context){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

// Item 1
  sliderModel.setLogo(AppImages.logo);
  sliderModel.setLogoTitle(AppStringConstant.onBoardingTitle1);
  sliderModel.setImage(AppImages.onBoardingScreen1);
  sliderModel.setDescription(AppStringConstant.onBoardingText1);
  slides.add(sliderModel);

  sliderModel = SliderModel();

// Item 2
  sliderModel.setLogo(AppImages.logo);
  sliderModel.setLogoTitle(AppStringConstant.onBoardingTitle2);
  sliderModel.setImage(AppImages.onBoardingScreen2);
  sliderModel.setDescription(AppStringConstant.onBoardingText2);
  slides.add(sliderModel);

  sliderModel = SliderModel();


  return slides;
}