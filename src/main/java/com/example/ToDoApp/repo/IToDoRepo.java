package com.example.ToDoApp.repo;

import com.example.ToDoApp.model.ToDo;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface IToDoRepo extends JpaRepository<ToDo, Long> {
    // Uncomment and update the following methods if needed in the future
    // List<ToDo> findByCategory(String category);
    // List<String> findDistinctCategories();
}
