package bk.atuan.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.service.ProductService;
import bk.atuan.laptopshop.service.UploadFileService;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ManageProductController {
    private final UploadFileService uploadFileService;
    private final ProductService productService;

    public ManageProductController(UploadFileService uploadFileService, ProductService productService) {
        this.uploadFileService = uploadFileService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductManagePage(Model model,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 3);
        Page<Product> pageProduct = this.productService.getAllProduct(pageable);
        List<Product> listProduct = pageProduct.getContent();
        model.addAttribute("listProduct", listProduct);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProduct.getTotalPages());
        return "admin/product/product";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/createProduct";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model, @RequestParam("pImage") MultipartFile pImage,
            @ModelAttribute("newProduct") @Valid Product newProduct, BindingResult newProductBingdingResult) {

        if (pImage.isEmpty()) {
            newProductBingdingResult.addError(new FieldError("newProduct", "image", "Image must not be empty"));
        }
        if (newProductBingdingResult.hasErrors()) {
            return "admin/product/createProduct";
        }

        if (!pImage.isEmpty()) {
            String image = this.uploadFileService.handleSaveFile(pImage, "product");
            newProduct.setImage(image);
        }

        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductInfoPage(Model model, @PathVariable long id) {
        Product productInfo = this.productService.getProductById(id);
        model.addAttribute("productInfo", productInfo);
        return "admin/product/productInfo";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/updateProduct";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @RequestParam("pImage") MultipartFile pImage,
            @ModelAttribute("product") @Valid Product product, BindingResult productBingdingResult) {

        if (productBingdingResult.hasErrors()) {
            return "admin/product/updateProduct";
        }
        Product currentProduct = this.productService.getProductById(product.getId());
        if (!pImage.isEmpty()) {
            this.uploadFileService.handleDeleteFile(currentProduct.getImage(), "product");
            String image = this.uploadFileService.handleSaveFile(pImage, "product");
            currentProduct.setImage(image);
        }

        currentProduct.setName(product.getName());
        currentProduct.setPrice(product.getPrice());
        currentProduct.setQuantity(product.getQuantity());
        currentProduct.setDetailDesc(product.getDetailDesc());
        currentProduct.setShortDesc(product.getShortDesc());
        currentProduct.setManufacturer(product.getManufacturer());
        currentProduct.setTarget(product.getTarget());
        this.productService.handleSaveProduct(currentProduct);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getMethodName(@PathVariable long id, Model model) {

        Product product = new Product();
        product.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "admin/product/deleteProduct";
    }

    @PostMapping("/admin/product/delete")
    public String postMethodName(@ModelAttribute("product") Product product) {
        Product productToDelete = this.productService.getProductById(product.getId());
        this.uploadFileService.handleDeleteFile(productToDelete.getImage(), "product");
        this.productService.deleteProductById(productToDelete.getId());
        return "redirect:/admin/product";
    }

}
