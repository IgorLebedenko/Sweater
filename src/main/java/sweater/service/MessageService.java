package sweater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import sweater.model.Message;
import sweater.repository.MessageRepository;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;


    public List<Message> findAll(String filter) {
        List<Message> messages;

        if (StringUtils.isEmpty(filter)) {
            messages = messageRepository.findAll();
        } else {
            messages = messageRepository.findByTag(filter);
        }

        return messages;
    }

    public void save(Message message) {
        messageRepository.save(message);
    }

}
