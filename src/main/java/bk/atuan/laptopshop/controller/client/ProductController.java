package bk.atuan.laptopshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.service.ProductService;

@Controller
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(Model model, @PathVariable("id") long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @GetMapping("/products")
    public String getAllProduct(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        if (page < 1)
            page = 1;

        Pageable pageable = PageRequest.of(page - 1, 6);
        Page<Product> pageProduct = this.productService.getAllProduct(pageable);
        List<Product> allProducts = pageProduct.getContent();
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProduct.getTotalPages());
        model.addAttribute("allProducts", allProducts);
        return "client/product/product-all";
    }
}
