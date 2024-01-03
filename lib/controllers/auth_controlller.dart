import 'package:ecommerce_app/models/auth_model.dart';
import 'package:ecommerce_app/models/response_model.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:ecommerce_app/service/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({ required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // @override
  // void onInit() {
  //   isAuthUser();
  //   super.onInit();
  // }

  Future<void> isAuthUser() async {
    Response response = await authRepo.isAuthUser();
    if(response.statusCode == 200) {
      print("Entro aqui");
      Get.toNamed(RouterHelper.getHomePage());
      _isLoading = true;
    } else {
      Get.toNamed(RouterHelper.getInitial());
    }
  }

  Future<void> logout() async {
    Response response = await authRepo.logout();
    if(response.statusCode == 200) {
      // remover el token 
      // cambiar los headers de la api client
      // Enviar al login 
    }
  }

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true,response.body["token"]);
    } else {
      responseModel = ResponseModel(false,response.statusText!);
    }
    _isLoading = true;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    Response response = await authRepo.login(email,password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["auth_token"]);
      responseModel = ResponseModel(true,response.body["auth_token"]);
    } else {
      responseModel = ResponseModel(false,response.statusText!);
    }
    _isLoading = true;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }




}