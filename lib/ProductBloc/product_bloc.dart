import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footgo/ProductBloc/product_event.dart';
import 'package:footgo/ProductBloc/product_state.dart';


 class ProductBloc extends Bloc <ProductEvent, ProductState>{
int value = 1;
double totalPrice = 0.0;
ProductBloc(): super(ProductInitialState()){
  on((event, emit) {
    if(event is ProductSelectIncreamentEvent){
      if(value == 1)
        {
          totalPrice =event.totalIncPri;
        }
      value ++;
      print("count : $value");
      print("total price : ${totalPrice}");
      totalPrice = (totalPrice + event.totalIncPri);
         print(" total price $totalPrice");

      return emit(ProductUpdateState(value: totalPrice));
    }
    else if(event is ProductSelectDecreamentEvent){
      if(value == 1)
        {
          totalPrice = event.totalDecPri;
        }
      if(value>1){
        value --;
        print("count : $value");
        print("total price : ${totalPrice}");
        totalPrice = (totalPrice! - event.totalDecPri);
        print(" total price $totalPrice");
      }
      return emit(ProductUpdateState(value: totalPrice));
    }
  });
}
}