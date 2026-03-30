package bk.atuan.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;

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
        List<User> listUser = this.userService.getAllUser();
        model.addAttribute("listUser", listUser);
        return "admin/user/listUser";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User userInfo = this.userService.getUserById(id);
        model.addAttribute("userInfo", userInfo);
        return "admin/user/userDetail";
    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/createUser";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String postSubmitForm(Model model, @ModelAttribute("newUser") User newUser) {
        userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User userInfo = this.userService.getUserById(id);
        model.addAttribute("user", userInfo);
        return "admin/user/updateUser";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("user") User userUpdate) {
        System.out.println(userUpdate);
        User currentUser = this.userService.getUserById(userUpdate.getId());
        System.out.println(currentUser);
        currentUser.setName(userUpdate.getName());
        currentUser.setPhoneNumber(userUpdate.getPhoneNumber());
        currentUser.setAddress(userUpdate.getAddress());
        System.out.println(userUpdate);
        this.userService.handleSaveUser(currentUser);
        return "redirect:/admin/user";
    }

}
