abstract class HomeScreenEvent{
  HomeScreenEvent();
}
class HomeScreenNavigateEvent extends HomeScreenEvent{
final double pri;
HomeScreenNavigateEvent({required this.pri});

}
