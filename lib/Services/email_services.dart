import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> sendPasswordReset(String email, String tempPassword) async {
  final String apiKey = dotenv.env['BREVO_API_KEY'] ?? '';

  final url = Uri.parse("https://api.brevo.com/v3/smtp/email");

  final body = jsonEncode({
    "to": [
      {"email": email}
    ],
    "templateId": 3,
    "params": {
      "TempPassword": tempPassword,
    },
  });

  final response = await http.post(
    url,
    headers: {
      "accept": "application/json",
      "api-key": apiKey,
      "content-type": "application/json",
    },
    body: body,
  );

  if (response.statusCode == 201) {
    print("✅ Reset email sent!");
  } else {
    print("❌ Failed: ${response.statusCode} - ${response.body}");
  }
}

Future<void> sendWelcomeEmail(String email, String firstName) async {
  final String apiKey = dotenv.env['BREVO_API_KEY'] ?? '';

  final url = Uri.parse("https://api.brevo.com/v3/smtp/email");

  final body = jsonEncode({
    "to": [
      {"email": email, "name": firstName}
    ],
    "templateId": 1, 
    "params": {
      "FirstName": firstName,
    },
  });

  final response = await http.post(
    url,
    headers: {
      "accept": "application/json",
      "api-key": apiKey,
      "content-type": "application/json",
    },
    body: body,
  );

  if (response.statusCode == 201) {
    print("✅ Welcome email sent successfully!");
  } else {
    print("❌ Failed to send email: ${response.statusCode} - ${response.body}");
  }
}

Future<void> sendNewEmailUp(String email, String firstName, String newEmail) async {
  final String apiKey = dotenv.env['BREVO_API_KEY'] ?? '';

  final url = Uri.parse("https://api.brevo.com/v3/smtp/email");

  final body = jsonEncode({
    "to": [
      {"email": email, "name": firstName}
    ],
    "templateId": 2, 
    "params": {
      "FirstName": firstName,
      "NewEmail": newEmail,
    },
  });

  final response = await http.post(
    url,
    headers: {
      "accept": "application/json",
      "api-key": apiKey,
      "content-type": "application/json",
    },
    body: body,
  );

  if (response.statusCode == 201) {
    print("✅ Email update notification sent!");
  } else {
    print("❌ Failed to send email update: ${response.statusCode} - ${response.body}");
  }
}