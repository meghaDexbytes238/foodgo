abstract class ProductEvent{
ProductEvent();
}
class ProductSelectIncreamentEvent extends ProductEvent{
double totalIncPri;
ProductSelectIncreamentEvent({ required this.totalIncPri});
}
class ProductSelectDecreamentEvent extends ProductEvent{
  double totalDecPri;
  ProductSelectDecreamentEvent({ required this.totalDecPri});
}