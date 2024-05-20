abstract class HomeScreenState{
  HomeScreenState();
}
class HomeScreenInitialState extends HomeScreenState{

}
// class HomeScreenUpdateState extends HomeScreenState{
//
// }
class HomeScreenNavigateToScreenState extends HomeScreenState{
   final double price ;
   HomeScreenNavigateToScreenState({required this.price});
}
class ChipsUpdatedState extends HomeScreenState{
  final List chipsLst;
  ChipsUpdatedState({required this.chipsLst,});
}