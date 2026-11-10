import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  bool _creatingAccount = false;
  bool _busy = false;
  String? _message;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _email.text.trim();
    final password = _password.text;
    if (!email.contains('@') || password.length < 8 ||
        (_creatingAccount && _name.text.trim().length < 2)) {
      setState(() => _message = 'Enter a valid email, an 8-character password, and your name when creating an account.');
      return;
    }
    setState(() { _busy = true; _message = null; });
    try {
      final auth = Supabase.instance.client.auth;
      if (_creatingAccount) {
        final response = await auth.signUp(
          email: email,
          password: password,
          data: {'full_name': _name.text.trim()},
        );
        if (response.session == null) {
          setState(() => _message = 'Account created. Check your email to confirm your address, then sign in.');
        }
      } else {
        await auth.signInWithPassword(email: email, password: password);
      }
    } on AuthException catch (error) {
      setState(() => _message = error.message);
    } catch (_) {
      setState(() => _message = 'Something went wrong. Please try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const Icon(Icons.school_outlined, size: 48, color: Color(0xFF1769AA)),
              const SizedBox(height: 18),
              const Text('Bureaucrats', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
              const SizedBox(height: 8),
              Text(_creatingAccount ? 'Create your CSS preparation account.' : 'Sign in to continue your preparation.', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF627D98))),
              const SizedBox(height: 28),
              if (_creatingAccount) ...[
                TextField(controller: _name, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Full name')),
                const SizedBox(height: 12),
              ],
              TextField(controller: _email, keyboardType: TextInputType.emailAddress, autofillHints: const [AutofillHints.email], decoration: const InputDecoration(labelText: 'Email address')),
              const SizedBox(height: 12),
              TextField(controller: _password, obscureText: true, autofillHints: const [AutofillHints.password], decoration: const InputDecoration(labelText: 'Password')),
              if (_message != null) ...[
                const SizedBox(height: 12),
                Text(_message!, style: const TextStyle(color: Color(0xFF9B2C2C))),
              ],
              const SizedBox(height: 18),
              FilledButton(
                onPressed: _busy ? null : _submit,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(_busy ? 'Please wait…' : _creatingAccount ? 'Create account' : 'Sign in'),
                ),
              ),
              TextButton(
                onPressed: _busy ? null : () => setState(() { _creatingAccount = !_creatingAccount; _message = null; }),
                child: Text(_creatingAccount ? 'Already have an account? Sign in' : 'New here? Create an account'),
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}
