package bk.atuan.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;

import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.service.UserService;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("test2", "Hello from controller");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getListUserPage(Model model) {
        // model.addAttribute("newUser", new User());
        return "admin/user/listUser";
    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/createUser";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getSubmitForm(Model model, @ModelAttribute("newUser") User newUser) {
        System.out.println("run here:" + newUser);
        userService.handleSaveUser(newUser);
        return "hello";
    }
}
