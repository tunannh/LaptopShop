package bk.atuan.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductDetailController {
    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        return "client/product/detail";
    }
}
