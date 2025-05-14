package vn.tranphudev.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.repository.UserRepository;
import vn.tranphudev.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;

    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsers();
        System.out.println(arrUsers);
        model.addAttribute("phu", "test");
        model.addAttribute("phutran", "From controller with model");
        return "hello";
    }

    @RequestMapping("/admin/user/create")
    public String geCreatetUser(Model model) {
        model.addAttribute("newUser", new User());

        return "/admin/user/create";
    }

    @RequestMapping("/admin/user")
    public String listUser(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("user1", users);
        return "/admin/user/listUser";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}
