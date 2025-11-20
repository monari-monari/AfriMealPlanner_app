// lib/data/entities/user_profile_entity.dart

class UserProfileEntity {
  final String id;
  final String email;
  final String firstName;
  final String region; // E.g., 'West Africa', 'East Africa'
  final int age;
  final double heightCm;
  final double weightKg;
  final String healthGoal; // E.g., 'Weight Loss', 'Maintenance', 'Muscle Gain'

  UserProfileEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.region,
    required this.age,
    required this.heightCm,
    required this.weightKg,
    required this.healthGoal,
  });

  // Factory method to create an entity from a data map (e.g., from Firestore)
  factory UserProfileEntity.fromMap(Map<String, dynamic> data) {
    return UserProfileEntity(
      id: data['id'] as String,
      email: data['email'] as String,
      firstName: data['firstName'] as String? ?? 'User',
      region: data['region'] as String? ?? 'Global',
      age: data['age'] as int? ?? 0,
      heightCm: (data['heightCm'] as num?)?.toDouble() ?? 0.0,
      weightKg: (data['weightKg'] as num?)?.toDouble() ?? 0.0,
      healthGoal: data['healthGoal'] as String? ?? 'Maintenance',
    );
  }

  // Method to convert the entity to a map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'region': region,
      'age': age,
      'heightCm': heightCm,
      'weightKg': weightKg,
      'healthGoal': healthGoal,
    };
  }

  // Utility to create a new instance with updated fields
  UserProfileEntity copyWith({
    double? weightKg,
    String? healthGoal,
    // ... other fields
  }) {
    return UserProfileEntity(
      id: id,
      email: email,
      firstName: firstName,
      region: region,
      age: age,
      heightCm: heightCm,
      weightKg: weightKg ?? this.weightKg,
      healthGoal: healthGoal ?? this.healthGoal,
    );
  }
}