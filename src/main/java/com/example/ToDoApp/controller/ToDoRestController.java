package com.example.ToDoApp.controller;

import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.service.ToDoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/todos")
public class ToDoRestController {

    @Autowired
    private ToDoService service;

    @GetMapping
    public List<ToDo> getAllToDos() {
        return service.getAllToDoItems();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ToDo> getToDoById(@PathVariable Long id) {
        Optional<ToDo> todo = Optional.ofNullable(service.getToDoItemById(id));
        return todo.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<ToDo> createToDoItem(@RequestBody ToDo todo) {
        ToDo savedTodo = service.saveOrUpdateToDoItem(todo);
        return ResponseEntity.ok(savedTodo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ToDo> updateToDoItem(@PathVariable Long id, @RequestBody ToDo todo) {
        Optional<ToDo> existingToDo = Optional.ofNullable(service.getToDoItemById(id));
        if (existingToDo.isPresent()) {
            todo.setId(id);
            ToDo updatedTodo = service.saveOrUpdateToDoItem(todo);
            return ResponseEntity.ok(updatedTodo);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteToDoItem(@PathVariable Long id) {
        if (service.deleteToDoItem(id)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
