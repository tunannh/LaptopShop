package bk.atuan.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import bk.atuan.laptopshop.domain.Role;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.service.UploadFileService;
import bk.atuan.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadFileService uploadFileService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadFileService uploadFileService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadFileService = uploadFileService;
        this.passwordEncoder = passwordEncoder;
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
    public String postSubmitForm(Model model, @ModelAttribute("newUser") User newUser,
            @RequestParam("userAvatar") MultipartFile avt) {
        String fileName = this.uploadFileService.handleSaveFile(avt, "avatar");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());
        newUser.setPassword(hashPassword);
        newUser.setAvatar(fileName);
        Role role = this.userService.getRoleByName(newUser.getRole().getName());
        newUser.setRole(role);
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
    public String postUpdateUser(Model model, @ModelAttribute("user") User userUpdate,
            @RequestParam("newUserAvatar") MultipartFile newAvt) {
        System.out.println(newAvt.getOriginalFilename());
        User currentUser = this.userService.getUserById(userUpdate.getId());
        currentUser.setName(userUpdate.getName());
        currentUser.setPhoneNumber(userUpdate.getPhoneNumber());
        currentUser.setAddress(userUpdate.getAddress());
        this.userService.handleSaveUser(currentUser);
        if (!currentUser.getRole().getName().equals(userUpdate.getRole().getName())) {
            currentUser.setRole(this.userService.getRoleByName(userUpdate.getRole().getName()));
        }
        if (!newAvt.isEmpty()) {
            this.uploadFileService.handleDeleteFile(currentUser.getAvatar(), "avatar");
            String newFileName = this.uploadFileService.handleSaveFile(newAvt, "avatar");
            currentUser.setAvatar(newFileName);
        }

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
