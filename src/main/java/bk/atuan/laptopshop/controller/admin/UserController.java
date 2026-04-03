package bk.atuan.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("test2", "Hello from controller");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getListUserPage(Model model) {
        List<User> listUser = this.userService.getAllUser();
        model.addAttribute("listUser", listUser);
        return "admin/user/listUser";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User userInfo = this.userService.getUserById(id);
        model.addAttribute("userInfo", userInfo);
        return "admin/user/userDetail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/createUser";
    }

    @PostMapping("/admin/user/create")
    public String postSubmitForm(Model model, @ModelAttribute("newUser") User newUser) {
        userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
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

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User user = new User();
        user.setId(id);
        model.addAttribute("user", user);
        return "admin/user/deleteUser";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("user") User user) {
        this.userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
