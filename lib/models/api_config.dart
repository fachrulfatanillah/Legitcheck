class APIConfigToken {
  static final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZhY2hydWwuZmF0YW5pbGxhaEBnbWFpbC5jb20iLCJpYXQiOjE3MjE4MjE2MzUsImV4cCI6MTczNzM3MzYzNX0.vWltJQGq-9xZghODt6dL6omemiivLVyVJOFrLUXX8u0';
}

class APIConfigUser {
  static final String baseUrl = 'https://api.legitcheck.online/user';
  static final String token = APIConfigToken.token;
}

class APIConfigOwnofProducts {
  static final String baseUrl = 'https://api.legitcheck.online/ownOfProducts';
  static final String token = APIConfigToken.token;
}

class APIConfigCategories {
  static final String baseUrl = 'https://api.legitcheck.online/categories';
  static final String token = APIConfigToken.token;
}

class APIConfigUserProducts {
  static final String baseUrl = 'https://api.legitcheck.online/UserProducts';
  static final String token = APIConfigToken.token;
}

class APIConfigOneTimePassword {
  static final String baseUrl = 'https://api.legitcheck.online/onetimepassword';
  static final String token = APIConfigToken.token;
}
