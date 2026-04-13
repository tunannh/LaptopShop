package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Role;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.domain.dto.RegisterDTO;
import bk.atuan.laptopshop.repository.RoleRepository;
import bk.atuan.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerUser) {
        User user = new User();
        user.setName(registerUser.getFirstName() + " " + registerUser.getLastName());
        user.setEmail(registerUser.getEmail());
        user.setPassword(registerUser.getConfirmPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }
}