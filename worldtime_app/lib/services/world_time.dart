import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // package untuk memformat penulisan waktu

class WorldTime {
  String location; // location name for the UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime = false; // true or false if daytime or not

  WorldTime({ this.location = '', this.flag = '', this.url = '' });

  Future<void> getTime() async {
  // Future = a placeholder value until the function is complete
    try {
    // try and catch are for error handling
    // jika code yang ada di dalam try error, maka error nya akan di catch
      http.Response response =
      await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);

        // print('Datetime: $datetime');
        // print('Offset: $offset');

        // create DateTime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        // set the time property
        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
        // syntax/widget yang digunakan untuk memformat penulisan waktu

      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      time = 'could not get time data';
    }
  }
}

