import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = StateProvider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final todoProvider = FutureProvider<List>((ref) async {
  final response = await ref.watch(supabaseClientProvider).from('my_todo').select();
  return response as List;
});
