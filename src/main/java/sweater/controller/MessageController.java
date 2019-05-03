package sweater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import sweater.model.Message;
import sweater.model.User;
import sweater.service.MessageService;

import java.io.IOException;

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
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam("text") String text,
                      @RequestParam("tag") String tag,
                      @RequestParam("file") MultipartFile file) throws IOException {
        Message message = new Message();
        message.setText(text);
        message.setTag(tag);
        message.setAuthor(user);

        messageService.save(message, file);

        return "redirect:/main";
    }
}
