import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/data/api/todo/todo_request_body.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_remote_data_source.g.dart';

@riverpod
TodoRds todoRds(TodoRdsRef ref) {
  final todoClient = ref.read(todoClientProvider);
  return TodoApiRds(todoClient);
}
/// Abstract class representing a remote data source for todos.
abstract class TodoRds {
  /// Retrieves a list of todos.
  Future<List<TodoResponse>> getTodos();

  /// Retrieves a todo by its ID.
  Future<TodoResponse> getTodo(
    int id,
  );

  /// Creates a new todo.
  Future<TodoResponse> createTodo(
    String title,
    TodoRequestBody body,
  );
}

/// Implementation of the [TodoRds] interface using an API client.
class TodoApiRds implements TodoRds {
  final TodoClient _client;

  const TodoApiRds(this._client);

  @override
  Future<List<TodoResponse>> getTodos() {
    return _client.getTodos();
  }

  @override
  Future<TodoResponse> getTodo(int id) {
    return _client.getTodo(id);
  }

  @override
  Future<TodoResponse> createTodo(
    String title,
    TodoRequestBody body,
  ) {
    return _client.createTodo(title, body);
  }
}
