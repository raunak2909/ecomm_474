import 'package:ecomm_474/data/helper/api_helper.dart';
import 'package:ecomm_474/domain/constants/app_urls.dart';
import 'package:ecomm_474/ui/user_on_boarding/bloc/user_event.dart';
import 'package:ecomm_474/ui/user_on_boarding/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  ApiHelper apiHelper;
  UserBloc({required this.apiHelper}) : super(UserInitialState()){

    on<SignUpUserEvent>((event, emit) async {

      emit(UserLoadingState());

      try{
        dynamic data = await apiHelper.postAPI(url: AppUrls.signUpUrl, mBodyParams: {
          "name": event.name,
          "mobile_number": event.mobNo,
          "email": event.email,
          "password": event.password
        });

        if(data["status"]){
          emit(UserSuccessState());
          /// we're getting user token
          /// store the token in prefs
        } else {
          emit(UserFailureState(errorMsg: data["message"]));
        }

      } catch (e){
        emit(UserFailureState(errorMsg: e.toString()));
      }

    });

    on<LoginUserEvent>((event, emit){

    });

  }


}