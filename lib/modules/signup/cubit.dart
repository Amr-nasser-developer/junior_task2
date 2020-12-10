import 'package:first_mission/modules/signup/state.dart';
import 'package:first_mission/shared/remote/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCubit extends Cubit<CurrentStates>{

  CurrentCubit() : super(CurrentInitial());

  static CurrentCubit get(context) => BlocProvider.of(context);

register({first , last , email , password , city}){
  emit(CurrentLoading());
  DioHelper.postData(
    path: 'lms/api/v1/auth/signup-save',
    data: {
          'first_name':'$first',
          'last_name': '$last',
          'email':'$email',
          'password' : '$password',
          'city' : '$city'
    }
  ).then((value)
  {
    emit(CurrentSuccess());
  });
}

Login({email , password }){
  emit(CurrentLoading());
  DioHelper.postData(
    path: 'lms/api/v1/auth/signup-save',
    data: {
      'email' : '$email',
      'password' : '$password',
    }
  ).then((value) {
    emit(CurrentSuccess());
  }).catchError((e)
  {
    emit(CurrentError(e.toString()));
  }
  );
}
}