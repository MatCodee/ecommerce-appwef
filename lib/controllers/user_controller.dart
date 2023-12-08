import 'package:ecommerce_app/models/response_model.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/service/repository/user_repo.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  late UserModel _userModel;


  UserController({
    required this.userRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel(true,"Successfully");
      _isLoading = true;
    } else {
      responseModel = ResponseModel(false,response.statusText!);
    }
    update();
    return responseModel;
  }


}