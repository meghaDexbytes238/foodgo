import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  double price = 0.0;
  List choiceItemsList = ['All', 'Combos', 'Sliders'];
  int selectedIndex = 0;

  TextEditingController searchController = TextEditingController();

  HomeScreenBloc() : super(HomeScreenInitialState()){
    on((event, emit) {
      if(event is HomeScreenNavigateEvent){
       return emit(HomeScreenNavigateToScreenState(price: event.pri));
      }
    });

    // on((event, emit) {
    //   if(event is LoadedChipsListEvent){
    //     selectedIndex = event.index;
    //     emit(ChipsUpdatedState(chipsLst: choiceItemsList));
    //   }
    // });
  }

}