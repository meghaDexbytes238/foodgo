abstract class HomeScreenEvent{
  HomeScreenEvent();
}
class HomeScreenNavigateEvent extends HomeScreenEvent{
final double pri;
HomeScreenNavigateEvent({required this.pri});

}
class LoadedChipsListEvent extends HomeScreenEvent{
  final int index;
  LoadedChipsListEvent({required this.index});
}