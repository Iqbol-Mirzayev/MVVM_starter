import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../dataLayer/db/cached_user_model.dart';
import '../dataLayer/model/user_data.dart';
import '../dataLayer/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.userRepository});

  final UserRepository userRepository;

  List<CachedUser> cachedUsers = [];
  UserData? userData;
  bool isLoading = false;

  void getCachedUsers() async {
    isLoading = true;
    notifyListeners();
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void getUserDataAndSave() async {
    isLoading = true;
    notifyListeners();
    userData = await userRepository.getUserData();
    await userRepository.insertUserFromApi(userData: userData!);
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void addUserDataSave(CachedUser cachedUser) async {
    isLoading = true;
    notifyListeners();
    await userRepository.insertCachedUser(cachedUser);
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void deleteAllUsers() async {
    isLoading = true;
    notifyListeners();
    await userRepository.deleteAllUsers();
    userData = await userRepository.getUserData();
    await userRepository.insertUserFromApi(userData: userData!);

    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }
}
