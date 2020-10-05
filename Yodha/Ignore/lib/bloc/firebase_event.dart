part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class RegisterUserWithEmail extends FirebaseEvent {
  final String email;
  final bool value;
  final BuildContext context;

  RegisterUserWithEmail(this.email, this.value, this.context);
}

class UpdateUserStatus extends FirebaseEvent {
  final String status, email;

  UpdateUserStatus(this.email, this.status);
}
