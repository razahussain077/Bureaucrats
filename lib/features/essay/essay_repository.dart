import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config.dart';

class EssayRepository {
  Future<String> evaluate({required String topic, required String essay}) async {
    if (!AppConfig.hasSupabase) throw StateError('Supabase is not configured.');
    final client = Supabase.instance.client;
    if (client.auth.currentUser == null) throw StateError('Sign in is required.');
    final response = await client.functions.invoke('evaluate-essay', body: {'topic': topic, 'essay': essay});
    if (response.status < 200 || response.status >= 300) {
      throw StateError('Essay evaluation failed.');
    }
    final data = response.data;
    if (data is! Map<String, dynamic>) throw const FormatException('Invalid examiner response.');
    final evaluation = data['evaluation'];
    if (evaluation is! Map<String, dynamic>) throw const FormatException('Missing evaluation.');
    final score = evaluation['total_score'];
    final feedback = evaluation['overall_feedback'];
    if (score is! num || feedback is! String) throw const FormatException('Invalid evaluation fields.');
    return const JsonEncoder.withIndent('  ').convert(evaluation);
  }
}
