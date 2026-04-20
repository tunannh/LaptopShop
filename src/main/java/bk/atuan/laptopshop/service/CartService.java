package bk.atuan.laptopshop.service;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart save(Cart cart) {
        if (cart != null) {
            return this.cartRepository.save(cart);
        }
        return null;
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }
}
