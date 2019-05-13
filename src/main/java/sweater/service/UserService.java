package sweater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import sweater.model.Role;
import sweater.model.User;
import sweater.repository.UserRepository;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailSender mailSender;


    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepository.save(user);

        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! Welcome to Sweater. Please visit next link: %sactivate/%s " +
                            "to activate your account.",
                    user.getUsername(),
                    "http://localhost:8080/",
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Activation code", message);
        }

        return true;
    }

    public void saveUser(User user, Map<String, String> formParams) {
        String newUsername = formParams.get("name");

        if (!StringUtils.isEmpty(newUsername)) {
            user.setUsername(newUsername);
        }

        Set<String> roles = Arrays.stream(Role.values())
                .map(Enum::toString)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        formParams.keySet().stream()
                .filter(k -> roles.contains(k))
                .forEach(k -> user.getRoles().add(Role.valueOf(k)));

        userRepository.save(user);
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);

        userRepository.save(user);

        return true;
    }
}
