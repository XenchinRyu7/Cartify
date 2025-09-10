import 'package:equatable/equatable.dart';

/// User entity representing a user in the e-commerce app
class User extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final bool isEmailVerified;
  final UserAddress? defaultAddress;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
    required this.createdAt,
    required this.lastLoginAt,
    required this.isEmailVerified,
    this.defaultAddress,
  });

  /// Create a copy of this user with updated fields
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    bool? isEmailVerified,
    UserAddress? defaultAddress,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      defaultAddress: defaultAddress ?? this.defaultAddress,
    );
  }

  /// Get full name of the user
  String get fullName => '$firstName $lastName';

  /// Get initials of the user
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();

  /// Check if user has a profile image
  bool get hasProfileImage => profileImageUrl != null && profileImageUrl!.isNotEmpty;

  /// Check if user has a phone number
  bool get hasPhoneNumber => phoneNumber != null && phoneNumber!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        profileImageUrl,
        createdAt,
        lastLoginAt,
        isEmailVerified,
        defaultAddress,
      ];

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $fullName, verified: $isEmailVerified)';
  }
}

/// User address entity for shipping and billing
class UserAddress extends Equatable {
  final String id;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String? apartment;
  final bool isDefault;

  const UserAddress({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.apartment,
    required this.isDefault,
  });

  /// Create a copy of this address with updated fields
  UserAddress copyWith({
    String? id,
    String? street,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? apartment,
    bool? isDefault,
  }) {
    return UserAddress(
      id: id ?? this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      apartment: apartment ?? this.apartment,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  /// Get formatted address string
  String get formattedAddress {
    final addressParts = [
      street,
      if (apartment != null) apartment,
      city,
      state,
      zipCode,
      country,
    ];
    return addressParts.join(', ');
  }

  /// Get short address (city, state, zip)
  String get shortAddress => '$city, $state $zipCode';

  @override
  List<Object?> get props => [
        id,
        street,
        city,
        state,
        zipCode,
        country,
        apartment,
        isDefault,
      ];

  @override
  String toString() {
    return 'UserAddress(id: $id, address: $formattedAddress, isDefault: $isDefault)';
  }
}
