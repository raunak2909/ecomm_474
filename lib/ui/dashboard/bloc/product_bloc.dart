import 'package:ecomm_474/data/helper/api_helper.dart';
import 'package:ecomm_474/data/models/product_model.dart';
import 'package:ecomm_474/domain/constants/app_urls.dart';
import 'package:ecomm_474/ui/dashboard/bloc/product_event.dart';
import 'package:ecomm_474/ui/dashboard/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()){


    on<FetchAllProductEvent>((event, emit) async {

      emit(ProductLoadingState());

      try{

       dynamic mData = await apiHelper.postAPI(url: AppUrls.getProductsUrl);
       if(mData["status"]){

         List<dynamic> mProducts = mData["data"];
         List<ProductModel> allProducts = [];
         for(Map<String, dynamic> eachProductMap in mProducts){
           allProducts.add(ProductModel.fromJson(eachProductMap));
         }
         emit(ProductLoadedState(mProducts: allProducts));

       } else {
         emit(ProductErrorState(errorMsg: mData["message"]));
       }

      } catch (e){
        emit(ProductErrorState(errorMsg: e.toString()));
      }


    });

    on<FetchAllProductByCategoryEvent>((event, emit){

    });

  }
}