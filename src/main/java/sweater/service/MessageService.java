package sweater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import sweater.model.Message;
import sweater.repository.MessageRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload.path}")
    String uploadPath;


    public List<Message> findAll(String filter) {
        List<Message> messages;

        if (StringUtils.isEmpty(filter)) {
            messages = messageRepository.findAll();
        } else {
            messages = messageRepository.findByTag(filter);
        }

        return messages;
    }

    public void save(Message message, MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String resultFilename = UUID.randomUUID() + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }

        messageRepository.save(message);
    }

}
