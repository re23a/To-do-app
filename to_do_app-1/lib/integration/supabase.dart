import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIntegration {
  get getSupabaseInitialize async {
    final supabaseInitialize = await Supabase.initialize(
      url: dotenv.env['url'].toString(),
      anonKey: dotenv.env['anonKey'].toString(),
    );
    return supabaseInitialize;
  }
}
