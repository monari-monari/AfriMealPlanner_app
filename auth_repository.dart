// lib/data/repositories/auth_repository.dart
import '../entities/user_profile_entity.dart';

abstract class AuthRepository {
  Stream<UserProfileEntity?> get user;

  Future<UserProfileEntity> signInWithEmailPassword(String email, String password);
  Future<UserProfileEntity> signUpWithEmailPassword(String email, String password, Map<String, dynamic> userDetails);
  Future<void> signOut();
  Future<void> updateProfile(UserProfileEntity user);
}

// TODO: Create a concrete implementation,
// e.g., lib/data/datasources/remote/firebase_auth_impl.dart

//import '../datasources/remote/firebase_auth_source.dart';
//import '../entities/user_profile.dart';
//import 'auth_repository.dart';


//class AuthRepositoryImpl implements AuthRepository {
//final FirebaseAuthSource authSource;


//AuthRepositoryImpl(this.authSource);


//@override
//Future<UserProfile?> login(String email, String password) async {
//final uid = await authSource.login(email, password);
//if (uid == null) return null;
//return UserProfile(uid: uid, name: "User", age: 25, email: email);
//}


//@override
//Future<void> logout() async {}
//}