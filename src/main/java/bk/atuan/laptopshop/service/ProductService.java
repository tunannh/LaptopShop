package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.CartDetail;
import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.repository.CartDetailRepository;
import bk.atuan.laptopshop.repository.CartRepository;
import bk.atuan.laptopshop.repository.ProductRepopsitory;
import bk.atuan.laptopshop.repository.UserRepository;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepopsitory productRepopsitory;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;

    public ProductService(ProductRepopsitory productRepopsitory, CartRepository cartRepository,
            UserRepository userRepository,
            CartDetailRepository cartDetailRepository) {
        this.productRepopsitory = productRepopsitory;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
    }

    public void handleSaveProduct(Product product) {
        if (product != null) {
            this.productRepopsitory.save(product);
        }
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

    public void handleAddProductToCart(long productId, long quantity, HttpSession session) {
        long userId = (long) session.getAttribute("id");
        User user = this.userRepository.findById(userId);

        Cart cart = this.cartRepository.findByUser(user);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cart.setSum(0);
            cart = this.cartRepository.save(cart);
        }

        Product product = this.productRepopsitory.findById(productId);
        if (product != null) {
            CartDetail cartDetail = this.cartDetailRepository.findByProductAndCart(product, cart);
            if (cartDetail == null) {
                CartDetail newCartDetail = new CartDetail();
                newCartDetail.setCart(cart);
                newCartDetail.setProduct(product);
                newCartDetail.setPrice(product.getPrice());
                newCartDetail.setQuantity(quantity);
                this.cartDetailRepository.save(newCartDetail);

                cart.setSum(cart.getSum() + 1);
                session.setAttribute("cartSum", cart.getSum());
                this.cartRepository.save(cart);

            } else {
                cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                this.cartDetailRepository.save(cartDetail);
            }
        }
    }

}
