package bk.atuan.laptopshop.domain.dto;

import bk.atuan.laptopshop.service.validator.RegisterChecked;
import jakarta.validation.constraints.NotEmpty;

@RegisterChecked
public class RegisterDTO {

    @NotEmpty(message = "First name cannot be left blank.")
    private String firstName;

    @NotEmpty(message = "Last name cannot be left blank.")
    private String lastName;

    @NotEmpty(message = "Email cannot be left blank")
    private String email;

    @NotEmpty(message = "Password cannot be left blank")
    private String password;

    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
