package vn.tranphudev.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public User handleSaveUser(User user) {
        User phu = this.userRepository.save(user);
        return phu;
    }
}
