package vn.tranphudev.laptopshop.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.tranphudev.laptopshop.domain.Order;
import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.domain.DTO.RegisterDTO;
import vn.tranphudev.laptopshop.domain.DTO.PasswordChangeDTO;
import vn.tranphudev.laptopshop.service.OrderService;
import vn.tranphudev.laptopshop.service.ProductService;
import vn.tranphudev.laptopshop.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // If page number is invalid, default to page 1
        }

        Pageable pageable = PageRequest.of(page - 1, 8); // Show 8 products per page
        Page<Product> products = this.productService.getAllProduct(pageable);
        List<Product> listProducts = products.getContent();

        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());

        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(Model model, @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {

        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }

    @GetMapping("/account")
    public String getAccountPage(Model model, Authentication authentication) {
        User user = userService.findByEmail(authentication.getName());
        List<Order> orders = orderService.findByUser(user);

        model.addAttribute("user", user);
        model.addAttribute("orders", orders);
        model.addAttribute("passwordChange", new PasswordChangeDTO());

        return "client/account/show";
    }

    @PostMapping("/account/update")
    public String updateProfile(@ModelAttribute("user") User user,
            Authentication authentication,
            HttpSession session) {
        User currentUser = userService.findByEmail(authentication.getName());
        currentUser.setFullName(user.getFullName());
        currentUser.setPhone(user.getPhone());
        currentUser.setAddress(user.getAddress());

        userService.updateUser(currentUser);

        // Update session with only necessary user data
        session.setAttribute("id", currentUser.getId());
        session.setAttribute("fullName", currentUser.getFullName());
        session.setAttribute("email", currentUser.getEmail());
        session.setAttribute("phone", currentUser.getPhone());
        session.setAttribute("address", currentUser.getAddress());

        return "redirect:/account";
    }

    @PostMapping("/account/change-password")
    public String changePassword(
            @Valid @ModelAttribute("passwordChange") PasswordChangeDTO passwordChange,
            BindingResult bindingResult,
            Authentication authentication,
            HttpSession session,
            RedirectAttributes redirectAttributes,
            Model model) {

        User user = userService.findByEmail(authentication.getName());
        List<Order> orders = orderService.findByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("orders", orders);

        if (bindingResult.hasErrors()) {
            model.addAttribute("showPasswordForm", true);
            return "client/account/show";
        }

        // Verify current password
        if (!passwordEncoder.matches(passwordChange.getCurrentPassword(), user.getPassword())) {
            bindingResult
                    .addError(new FieldError("passwordChange", "currentPassword", "Current password is incorrect"));
            model.addAttribute("showPasswordForm", true);
            return "client/account/show";
        }

        // Verify new passwords match
        if (!passwordChange.getNewPassword().equals(passwordChange.getConfirmPassword())) {
            bindingResult.addError(new FieldError("passwordChange", "confirmPassword", "Passwords do not match"));
            model.addAttribute("showPasswordForm", true);
            return "client/account/show";
        }

        // Update password
        user.setPassword(passwordEncoder.encode(passwordChange.getNewPassword()));
        userService.updateUser(user);

        // Update session with only necessary user data
        session.setAttribute("id", user.getId());
        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("phone", user.getPhone());
        session.setAttribute("address", user.getAddress());

        redirectAttributes.addFlashAttribute("successMessage", "Password updated successfully");
        return "redirect:/account";
    }
}
