abstract class ProductState{
ProductState();
}
class ProductInitialState extends ProductState{

}

class ProductUpdateState extends ProductState{
  final double value;
  ProductUpdateState({required this.value});
}

