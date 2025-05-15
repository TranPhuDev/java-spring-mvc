package vn.tranphudev.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.service.UploadService;
import vn.tranphudev.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // return "admin/dashboard/show";
    // }

    // UI Create user
    @GetMapping("/admin/user/create")
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
    @PostMapping("/admin/user/create")
    public String createUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("uploadFile") MultipartFile file, RedirectAttributes redirectAttributes) {
        String avatar = this.uploadService.handelSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "User created successfully!");
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
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("uploadFile") MultipartFile file, RedirectAttributes redirectAttributes) {
        User currentUser = this.userService.handleDetailUser(user.getId());
        String avatar = this.uploadService.handelSaveUploadFile(file, "avatar");

        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            currentUser.setAvatar(avatar);
            this.userService.handleSaveUser(currentUser);
            redirectAttributes.addFlashAttribute("successMessage", "User updated successfully!");
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
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User user,
            RedirectAttributes redirectAttributes) {
        this.userService.deleteUser(user.getId());
        redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully!");
        return "redirect:/admin/user";
    }

}
