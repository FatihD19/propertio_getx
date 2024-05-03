import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 0,
      ).format(int.parse(this));
}

String formatCurrency(String value) {
  if (int.parse(value) >= 1000000000) {
    double result = int.parse(value) / 1000000000.0;
    return ('Rp ${result.toStringAsFixed(2)} Miliar').replaceAll('.', ',');
  } else if (int.parse(value) >= 1000000) {
    double result = int.parse(value) / 1000000.0;
    return ('Rp ${result.toStringAsFixed(2)} Juta').replaceAll('.', ',');
  } else {
    return '${value.currencyFormatRp}';
  }
}

String formatCurrencyDouble(double amount) {
  String formattedString = amount.toStringAsFixed(0);
  return formattedString.currencyFormatRp;
}

String calculateTimeDifference(String apiTimeString) {
  // Konversi string waktu dari API menjadi objek DateTime
  DateTime apiTime = DateTime.parse(apiTimeString);

  // Waktu saat ini
  DateTime currentTime = DateTime.now();

  // Hitung selisih waktu
  Duration difference = currentTime.difference(apiTime);

  if (difference.inMinutes < 1) {
    return 'Baru saja';
  } else if (difference.inHours < 1) {
    int minutes = difference.inMinutes;
    return '$minutes menit yang lalu';
  } else if (difference.inDays < 1) {
    int hours = difference.inHours;
    return '$hours jam yang lalu';
  } else if (difference.inDays < 30) {
    int days = difference.inDays;
    return '$days hari yang lalu';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months bulan yang lalu';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years tahun yang lalu';
  }
}

int calculateTimeChat(DateTime apiTimeString) {
  // Waktu saat ini
  DateTime currentTime = DateTime.now();

  var apiTime = apiTimeString.toUtc().add(Duration(hours: 7));
  // Hitung selisih waktu
  Duration difference = currentTime.difference(apiTime);

  return difference.inSeconds;
}

Future<String> formatStringToIndonesianDate(String dateString) async {
  try {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    DateTime dateTime = inputFormat.parse(dateString);

    DateFormat outputFormat = DateFormat('dd MMMM yyyy', 'id');
    String formattedDate = outputFormat.format(dateTime);
    return formattedDate;
  } catch (e) {
    print('Error: $e');
    return '';
  }
}

String formatDate(DateTime dateTime) {
  // Locale Indonesia
  var format = DateFormat.yMMMMd('id_ID');
  return format.format(dateTime);
}

String formatClock(DateTime dateTime) {
  // Set zona waktu ke Waktu Indonesia Bagian Barat (WIB)
  var jakartaTime = dateTime.toUtc().add(Duration(hours: 7));

  // Format waktu dengan zona waktu yang telah disetel
  var format = DateFormat('HH:mm');

  // Format waktu dengan zona waktu yang telah disetel
  return format.format(jakartaTime);
}

class NetworkInfoException {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
