package sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sweater.model.Message;
import sweater.service.MessageService;

@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;


    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       Model model) {
        model.addAttribute("messages", messageService.findAll(filter));
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/add")
    public String add(@RequestParam String text,
                      @RequestParam String tag,
                      Model model) {
        Message message = new Message();
        message.setText(text);
        message.setTag(tag);

        messageService.save(message);

        return "redirect:/main";
    }
}
