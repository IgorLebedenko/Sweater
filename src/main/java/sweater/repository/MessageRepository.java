package sweater.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sweater.model.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {

    List<Message> findByTag(String tag);
}
