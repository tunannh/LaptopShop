package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.repository.ProductRepopsitory;

@Service
public class ProductService {
    private final ProductRepopsitory productRepopsitory;

    public ProductService(ProductRepopsitory productRepopsitory) {
        this.productRepopsitory = productRepopsitory;
    }

    public void handleSaveProduct(Product product) {
        this.productRepopsitory.save(product);
    }

    public List<Product> getAllProduct() {
        return this.productRepopsitory.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepopsitory.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepopsitory.deleteById(id);
    }
}
