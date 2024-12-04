/// Custom exception class to handle various format-related errors.
class PFormatExceptions implements Exception {
  
  String message;

  PFormatExceptions([this.message = 'An unexpected format error occurred. Please check your input.']);

  factory PFormatExceptions.fromMessage(String message){
    return PFormatExceptions(message);
  }

  String get FormattedMessage => message;

  factory PFormatExceptions.fromCode(String code){
      switch (code) {
      case 'invalid-email-format':
        return  PFormatExceptions('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return  PFormatExceptions('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return  PFormatExceptions('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return  PFormatExceptions('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return  PFormatExceptions('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return  PFormatExceptions('The input should be a valid numeric format.');
    // Add more cases as needed...
      default:
        return PFormatExceptions();
    }
  
  }



}
