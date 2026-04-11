package bk.atuan.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.service.ProductService;

@Controller
public class ProductDetailController {
    private final ProductService productService;

    public ProductDetailController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}
