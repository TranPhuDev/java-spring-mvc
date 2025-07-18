package vn.tranphudev.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.tranphudev.laptopshop.domain.Role;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.domain.DTO.RegisterDTO;
import vn.tranphudev.laptopshop.repository.OrderRepository;
import vn.tranphudev.laptopshop.repository.ProductRepsitory;
import vn.tranphudev.laptopshop.repository.RoleRepository;
import vn.tranphudev.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepsitory productRepsitory;
    private final OrderRepository orderRepository;

    public UserService(RoleRepository roleRepository, UserRepository userRepository, ProductRepsitory productRepsitory,
            OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.orderRepository = orderRepository;
        this.productRepsitory = productRepsitory;

    }

    public String handleHello() {
        return "Hello from service";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User phu = this.userRepository.save(user);
        return phu;
    }

    public User handleDetailUser(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();

        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setAvatar("default.jpg");

        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProductcs() {
        return this.productRepsitory.count();

    }

    public long countOrders() {
        return this.orderRepository.count();

    }

    public User findByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User updateUser(User user) {
        return this.userRepository.save(user);
    }

    public void saveUser(User user) {
        this.userRepository.save(user);
    }

}
