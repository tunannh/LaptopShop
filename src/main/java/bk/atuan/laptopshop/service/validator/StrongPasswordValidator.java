package bk.atuan.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {
    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }
        String regex = "^(?=.*[a-z])(?=.*[A-Z]).{6,}$";
        return value.matches(regex);
    }
}
