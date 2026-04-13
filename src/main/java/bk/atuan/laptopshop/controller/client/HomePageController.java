package bk.atuan.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.domain.dto.RegisterDTO;
import bk.atuan.laptopshop.service.ProductService;
import bk.atuan.laptopshop.service.UserService;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> allProducts = this.productService.getAllProduct();
        model.addAttribute("allProducts", allProducts);
        return "client/homepage/home";
    }

    @GetMapping("/access-deny")
    public String getAccessDenyPage() {
        return "client/auth/access-deny";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String postMethodName(@ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
            BindingResult registerBindding) {
        if (registerBindding.hasErrors()) {
            return "client/auth/register";
        }
        User newUser = this.userService.registerDTOtoUser(registerUser);

        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());
        newUser.setPassword(hashPassword);

        newUser.setRole(this.userService.getRoleByName("User"));

        this.userService.handleSaveUser(newUser);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

}
