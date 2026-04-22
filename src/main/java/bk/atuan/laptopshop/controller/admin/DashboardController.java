package bk.atuan.laptopshop.controller.admin;

import bk.atuan.laptopshop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    private final UserService userService;

    DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/dashboard")
    public String getDashboardPage(Model model) {
        model.addAttribute("countUser", this.userService.countUsers());
        model.addAttribute("countProduct", this.userService.countProducts());
        model.addAttribute("countOrder", this.userService.countOrders());
        return "admin/dashboard/dashboard";
    }

}
