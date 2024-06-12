import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  // Cria uma instância de FirebaseAuth para gerenciar autenticação
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Método assíncrono para cadastrar um novo usuário com email e senha
  Future<void> cadastrarUsuario({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Cria um novo usuário com email e senha
      UserCredential userCredential = 
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Atualiza o nome de exibição do usuário
      await userCredential.user!.updateDisplayName('$firstName $lastName');
    } catch (e) {
      // Trata erros que ocorrem durante o cadastro do usuário
      print('Erro ao cadastrar usuário: $e');
      throw e;  // Propaga o erro para ser tratado em outro lugar, se necessário
    }
  }

  // Método assíncrono para autenticar um usuário com email e senha
  Future<String?> logarUsuarios({
    required String email,
    required String password,
  }) async {
    try {
      // Tenta autenticar o usuário com email e senha
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;  // Retorna null se a autenticação for bem-sucedida
    } on FirebaseAuthException catch (e) {
      // Retorna a mensagem de erro se ocorrer um erro de autenticação
      return e.message;
    }
  }
}

