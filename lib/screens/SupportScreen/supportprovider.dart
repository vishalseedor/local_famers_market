
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FeedbackProvider with ChangeNotifier {
  Future  addFeedback({String? userId, String? comments}) async {
    String apiUrl = 'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/add_feedback.php?userid=$userId&comments=$comments';
    var response = await http.post(Uri.parse(apiUrl), body: {
      'userid': userId,
      'comments': comments,
    });

    if (response.statusCode == 200) {
      
      // Handle success
      print('Feedback added successfully');
    } else {
      // Handle errors
      print('Failed to add feedback. Error: ${response.statusCode}');
    }
  }
}

