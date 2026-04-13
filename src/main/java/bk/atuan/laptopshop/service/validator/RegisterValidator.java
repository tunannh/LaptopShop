package bk.atuan.laptopshop.service.validator;

import bk.atuan.laptopshop.domain.dto.RegisterDTO;
import bk.atuan.laptopshop.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO register, ConstraintValidatorContext context) {
        boolean valid = true;
        if (register.getConfirmPassword() != null && register.getPassword() == null) {
            return true;
        }
        if (!register.getPassword().equals(register.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Password must match")
                    .addPropertyNode("password")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        if (this.userService.checkEmailExist(register.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email have already exist")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
