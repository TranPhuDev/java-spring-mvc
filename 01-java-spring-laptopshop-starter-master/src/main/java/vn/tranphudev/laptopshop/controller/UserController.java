package vn.tranphudev.laptopshop.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
        return "admin/user/create";
    }

    // get list user
    @RequestMapping("/admin/user")
    public String listUser(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("user1", users);
        return "admin/user/listUser";
    }

    // create user
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Detail user
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.handleDetailUser(id);
        model.addAttribute("id", id);
        model.addAttribute("user", user);

        return "admin/user/userDetail";
    }

    // page update user
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUser(Model model, @PathVariable long id) {
        User currentUser = this.userService.handleDetailUser(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // update user
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.handleDetailUser(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(currentUser);

        }
        return "redirect:/admin/user";
    }

    // page delete user
    @RequestMapping("/admin/user/delete/{id}")
    public String getDeleteUser(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());

        return "admin/user/delete";
    }

    // delete user
    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";

    }

}
