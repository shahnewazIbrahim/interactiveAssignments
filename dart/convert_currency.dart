import 'dart:io';

void main() {
  // USDConversion rate
  Map<String, double> toUSD = {
    'USD': 1.0,
    'EUR': 1.1,
    'GBP': 1.3,
    'INR': 1 / 83.0,
    'JPY': 1 / 150.0,
  };

  // currency codes
  List<String> supportedCurrencies = toUSD.keys.toList();

  print('Supported currencies: ${supportedCurrencies.join(', ')}');

  // Input amount
  stdout.write('Enter amount to convert: ');
  double? amount = double.tryParse(stdin.readLineSync()!);

  if (amount == null || amount < 0) {
    print('Invalid amount. Please enter a positive number.');
    return;
  }

  // Input source currency
  stdout.write('Enter source currency (e.g., USD, EUR): ');
  String sourceCurrency = stdin.readLineSync()!.toUpperCase();

  if (!toUSD.containsKey(sourceCurrency)) {
    print('Unsupported source currency.');
    return;
  }

  // Input target currency
  stdout.write('Enter target currency (e.g., INR, JPY): ');
  String targetCurrency = stdin.readLineSync()!.toUpperCase();

  if (!toUSD.containsKey(targetCurrency)) {
    print('Unsupported target currency.');
    return;
  }

  // Convert amount
  double amountInUSD = amount * toUSD[sourceCurrency]!;
  double convertedAmount = amountInUSD / toUSD[targetCurrency]!;

  print('\n $amount $sourceCurrency is equal to ${convertedAmount.toStringAsFixed(2)} $targetCurrency');
}
