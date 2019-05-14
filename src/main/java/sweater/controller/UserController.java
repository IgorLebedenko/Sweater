package sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sweater.model.Role;
import sweater.model.User;
import sweater.service.UserService;

import java.util.Map;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.getAllUsers());

        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String editUser(@PathVariable User user,
                           Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "editUser";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String saveUser(@RequestParam("userId") User user,
                           @RequestParam Map<String, String> formParams) {
        userService.saveUser(user, formParams);

        return "redirect:/users";
    }

    @GetMapping("/profile")
    public String userProfile(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("/profile")
    public String updateUser(@AuthenticationPrincipal User user,
                             @RequestParam String password,
                             @RequestParam String email) {
        userService.updateUser(user, password, email);

        return "redirect:/users/profile";
    }
}
