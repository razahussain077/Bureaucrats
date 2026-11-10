import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config.dart';

class EssayRepository {
  Future<Map<String, dynamic>> evaluate({required String topic, required String essay}) async {
    if (!AppConfig.hasSupabase) throw StateError('Supabase is not configured.');
    final client = Supabase.instance.client;
    if (client.auth.currentUser == null) throw StateError('Sign in is required.');
    final response = await client.functions.invoke('evaluate-essay', body: {'topic': topic, 'essay': essay});
    if (response.status < 200 || response.status >= 300) throw StateError('Essay evaluation failed.');
    final data = response.data;
    if (data is! Map<String, dynamic>) throw const FormatException('Invalid examiner response.');
    final evaluation = data['evaluation'];
    if (evaluation is! Map<String, dynamic>) throw const FormatException('Missing evaluation.');
    if (evaluation['total_score'] is! num || evaluation['rubric'] is! Map<String, dynamic> ||
        evaluation['strengths'] is! List || evaluation['weaknesses'] is! List ||
        evaluation['actionable_revisions'] is! List || evaluation['overall_feedback'] is! String) {
      throw const FormatException('Invalid evaluation fields.');
    }
    return evaluation;
  }
}
