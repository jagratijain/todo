package com.example.ToDoApp.controller;

import com.example.ToDoApp.model.ToDo;
import com.example.ToDoApp.service.ToDoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ToDoController {

    private static final Logger logger = LoggerFactory.getLogger(ToDoController.class);

    @Autowired
    private ToDoService service;

    @GetMapping({"/", "/viewToDoList"})
    public String viewAllToDoItems(Model model, @ModelAttribute("message") String message) {
        model.addAttribute("list", service.getAllToDoItems());
        model.addAttribute("message", message);
        return "ViewToDoList";
    }

    @GetMapping("/updateToDoStatus/{id}")
    public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            boolean updated = service.updateStatus(id);
            redirectAttributes.addFlashAttribute("message", updated ? "Update Success" : "Update Failure");
            return "redirect:/viewToDoList";
        } catch (Exception e) {
            logger.error("Error updating ToDo status for ID: {}", id, e);
            redirectAttributes.addFlashAttribute("message", "Update Error");
            return "redirect:/viewToDoList";
        }
    }

    @GetMapping("/addToDoItem")
    public String addToDoItem(Model model) {
        model.addAttribute("todo", new ToDo());
        return "AddToDoItem";
    }

    @PostMapping("/saveToDoItem")
    public String saveToDoItem(@ModelAttribute ToDo todo, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "AddToDoItem";
        }
        try {
            ToDo savedTodo = service.saveOrUpdateToDoItem(todo);
            redirectAttributes.addFlashAttribute("message", savedTodo != null ? "Save Success" : "Save Failure");
            return savedTodo != null ? "redirect:/viewToDoList" : "redirect:/addToDoItem";
        } catch (Exception e) {
            logger.error("Error saving ToDo item", e);
            redirectAttributes.addFlashAttribute("message", "Save Error");
            return "redirect:/addToDoItem";
        }
    }

    @GetMapping("/editToDoItem/{id}")
    public String editToDoItem(@PathVariable Long id, Model model) {
        ToDo todo = service.getToDoItemById(id);
        if (todo != null) {
            model.addAttribute("todo", todo);
            return "EditToDoItem";
        }
        return "redirect:/viewToDoList";
    }

    @PostMapping("/editSaveToDoItem")
    public String editSaveToDoItem(@ModelAttribute ToDo todo, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "EditToDoItem";
        }
        try {
            ToDo updatedTodo = service.saveOrUpdateToDoItem(todo);
            redirectAttributes.addFlashAttribute("message", updatedTodo != null ? "Edit Success" : "Edit Failure");
            return updatedTodo != null ? "redirect:/viewToDoList" : "redirect:/editToDoItem/" + todo.getId();
        } catch (Exception e) {
            logger.error("Error editing ToDo item", e);
            redirectAttributes.addFlashAttribute("message", "Edit Error");
            return "redirect:/editToDoItem/" + todo.getId();
        }
    }

    @GetMapping("/deleteToDoItem/{id}")
    public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            boolean deleted = service.deleteToDoItem(id);
            redirectAttributes.addFlashAttribute("message", deleted ? "Delete Success" : "Delete Failure");
            return "redirect:/viewToDoList";
        } catch (Exception e) {
            logger.error("Error deleting ToDo item", e);
            redirectAttributes.addFlashAttribute("message", "Delete Error");
            return "redirect:/viewToDoList";
        }
    }
}
