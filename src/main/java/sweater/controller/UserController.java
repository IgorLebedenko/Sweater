package sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sweater.model.Role;
import sweater.model.User;
import sweater.service.UserService;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.getAllUsers());

        return "userList";
    }

    @GetMapping("{user}")
    public String editUser(@PathVariable User user,
                           Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "editUser";
    }

    @PostMapping
    public String saveUser(@RequestParam("userId") User user,
                           @RequestParam Map<String, String> formParams) {
        userService.saveUser(user, formParams);

        return "redirect:/users";
    }
}
