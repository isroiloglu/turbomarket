import 'package:equatable/equatable.dart';

abstract class MyPointScreenEvent extends Equatable{}



class MyPointScreenFetchEvent extends MyPointScreenEvent{
  MyPointScreenFetchEvent();

  @override
  List<Object?> get props => [];
}