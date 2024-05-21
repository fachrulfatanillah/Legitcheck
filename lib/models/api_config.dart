class APIConfigToken {
  static final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZhY2hydXJAZ21haWwuY29tIiwiaWF0IjoxNzE0Mzc2ODYzLCJleHAiOjE3MTY5Njg4NjN9.bGcQZcDVU2mSf1DJtcVWRoTP2j9aWl6LSsqv9mtrT4M';
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
