package vn.tranphudev.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.tranphudev.laptopshop.service.UserService;
import vn.tranphudev.laptopshop.service.OrderService;

@Controller
public class DashboardController {

    private final UserService userService;
    private final OrderService orderService;

    public DashboardController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countProducts", this.userService.countProductcs());
        model.addAttribute("countOrders", this.userService.countOrders());
        model.addAttribute("totalRevenue", this.orderService.calculateTotalRevenue());
        model.addAttribute("recentOrders", this.orderService.getRecentOrders(5));
        return "admin/dashboard/show";
    }
}
