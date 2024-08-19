package com.example.ToDoApp.service;

import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.repo.IToDoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ToDoService {

    @Autowired
    private IToDoRepo repo;

    /**
     * Retrieves all to-do items.
     * @return List of all ToDo items.
     */
    public List<ToDo> getAllToDoItems() {
        return repo.findAll();
    }

    /**
     * Retrieves a to-do item by its ID.
     * @param id The ID of the to-do item.
     * @return The ToDo item if found, null otherwise.
     */
    public ToDo getToDoItemById(Long id) {
        return repo.findById(id).orElse(null); // Return null if not found
    }

    /**
     * Saves or updates a to-do item.
     * @param todo The ToDo item to save or update.
     * @return The saved ToDo item.
     */
    public ToDo saveOrUpdateToDoItem(ToDo todo) {
        return repo.save(todo); // Return the saved entity
    }

    /**
     * Updates the status of a to-do item to "Completed".
     * @param id The ID of the to-do item.
     * @return true if the status was updated successfully, false otherwise.
     */
    public boolean updateStatus(Long id) {
        ToDo todo = getToDoItemById(id);
        if (todo != null) {
            todo.setStatus("Completed");
            repo.save(todo); // Save the updated entity
            return true; // Return true if update was successful
        }
        return false; // Return false if item was not found
    }

    /**
     * Deletes a to-do item by its ID.
     * @param id The ID of the to-do item.
     * @return true if the item was deleted successfully, false otherwise.
     */
    public boolean deleteToDoItem(Long id) {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return !repo.existsById(id); // Return true if delete was successful
        }
        return false; // Return false if item was not found
    }
}