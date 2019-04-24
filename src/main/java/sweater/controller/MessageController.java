package sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sweater.service.MessageService;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;


    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       Model model) {
        model.addAttribute("messages", messageService.findAll(filter));
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/add")
    public String add(@RequestParam String text,
                      @RequestParam String tag) {
        messageService.save(text, tag);

        return "redirect:/main";
    }
}
