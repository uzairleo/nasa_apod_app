// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import '../../features/auth/domain/entity/user.dart';

// class LocalStorageService {
//   final GetStorage _storage;
//   // User? locaUser;

//   LocalStorageService._create(this._storage);

//   static Future<LocalStorageService> create() async {
//     await GetStorage.init();
//     final storage = GetStorage();
//     return LocalStorageService._create(storage);
//   }

//   static const String usersKey = 'users';

//   List<User> getAllUsers() {
//     try {
//       final List<dynamic>? usersData = _storage.read<List<dynamic>>(usersKey);
//       if (usersData != null) {
//         return usersData
//             .map((user) => User.fromJson(Map<String, dynamic>.from(user)))
//             .toList();
//       }
//       return [];
//     } catch (e) {
//       debugPrint(e.toString());
//       return [];
//     }
//   }

//   Future<void> saveUser(User user) async {
//     try {
//       locaUser = user;
//       final users = getAllUsers();
//       final index = users.indexWhere(
//           (existingUser) => existingUser.phoneNumber == user.phoneNumber);

//       if (index >= 0) {
//         users[index] = user;
//       } else {
//         users.add(user);
//       }
//       await _storage.write(
//           usersKey, users.map((user) => user.toJson()).toList());
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   User? getUser(String phoneNumber) {
//     try {
//       final users = getAllUsers();
//       return users.firstWhere((user) => user.phoneNumber == phoneNumber,
//           orElse: () => User());
//     } catch (e) {
//       debugPrint(e.toString());
//       return null;
//     }
//   }

//   Future<void> updateUser(User user) async {
//     try {
//       final users = getAllUsers();
//       final index = users.indexWhere(
//           (existingUser) => existingUser.phoneNumber == user.phoneNumber);

//       if (index >= 0) {
//         users[index] = user;
//         await _storage.write(
//             usersKey, users.map((user) => user.toJson()).toList());
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   Future<void> removeUser(String phoneNumber) async {
//     try {
//       final users = getAllUsers();
//       users.removeWhere((user) => user.phoneNumber == phoneNumber);
//       await _storage.write(
//           usersKey, users.map((user) => user.toJson()).toList());
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   User? getLastLoginUser() {
//     try {
//       final users = getAllUsers();

//       if (users.isNotEmpty) {
//         return users.reduce(
//             (a, b) => a.lastUpdatedAt!.compareTo(b.lastUpdatedAt!) > 0 ? a : b);
//       }
//       return null;
//     } catch (e) {
//       debugPrint(e.toString());
//       return null;
//     }
//   }

//   Future<void> clearCurrentUserToken() async {
//     try {
//       final lastLoginUser = getLastLoginUser();
//       if (lastLoginUser != null) {
//         lastLoginUser.idToken = '';
//         lastLoginUser.lastUpdatedAt = DateTime.now().toIso8601String();
//         await updateUser(lastLoginUser);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }
