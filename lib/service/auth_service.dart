import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Создание нового аккаунта с email и паролем
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Добавление пользователя в Firestore с его ролью (например, 'user')
      await _firestore.collection('users').doc(user?.uid).set({
        'email': email,
        'role': 'user', // Устанавливаем роль по умолчанию
      });

      return user;
    } catch (error) {
      // Обработка ошибок
      print(error.toString());
      return null;
    }
  }

  // Вход с использованием учетной записи Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // Пользователь отменил вход
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Проверка наличия пользователя в Firestore и добавление, если его там нет
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user?.uid).get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'email': userCredential.user?.email,
          'role': 'user', // Устанавливаем роль по умолчанию для новых пользователей
        });
      }

      return userCredential;
    } catch (error) {
      // Обработка ошибок
      print(error.toString());
      return null;
    }
  }

  // Вход с использованием email и пароля
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      // Обработка ошибок
      print(error.toString());
      return null;
    }
  }

  // Отправка письма для сброса пароля
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
