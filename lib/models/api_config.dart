class APIConfigToken {
  static final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZhY2hydWwuZmF0YW5pbGxhaEBnbWFpbC5jb20iLCJpYXQiOjE3MTcwMDQ5MzgsImV4cCI6MTcxOTU5NjkzOH0.XBzH2V-d4Yhk1mnN5hS-wOqZCK6-9GiKmOc1HL8myEk';
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
