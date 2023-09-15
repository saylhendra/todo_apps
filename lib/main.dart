import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hfbybcdwxlufsbrkixat.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhmYnliY2R3eGx1ZnNicmtpeGF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4MTM1OTMsImV4cCI6MjAxMDM4OTU5M30.7EWDbf2nY2gOLa13eA8JcoT5wVOLmkHUlWMjv2kOTh8',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
