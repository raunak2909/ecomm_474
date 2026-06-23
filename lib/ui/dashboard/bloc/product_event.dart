abstract class ProductEvent {}

class FetchAllProductEvent extends ProductEvent{}
class FetchAllProductByCategoryEvent extends ProductEvent{
  final int categoryId;
  FetchAllProductByCategoryEvent({required this.categoryId});
}
