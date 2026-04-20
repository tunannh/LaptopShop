package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.CartDetail;
import bk.atuan.laptopshop.domain.Product;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.repository.CartDetailRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetaiRepository;
    private final CartService cartService;

    public CartDetailService(CartDetailRepository cartDetaiRepository, CartService cartService) {
        this.cartDetaiRepository = cartDetaiRepository;
        this.cartService = cartService;
    }

    public CartDetail save(CartDetail cartDetail) {
        if (cartDetail != null) {
            return this.cartDetaiRepository.save(cartDetail);
        }
        return null;
    }

    public CartDetail getCartDetailByProductAndCart(Product product, Cart cart) {
        return this.cartDetaiRepository.findByProductAndCart(product, cart);
    }

    public List<CartDetail> getCartDetailByCart(Cart cart) {
        return this.cartDetaiRepository.findByCart(cart);
    }

    public void handleRemoveCart(long cartDetailId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");
        User user = new User();
        user.setId(userId);
        Cart cart = this.cartService.getCartByUser(user);
        this.cartDetaiRepository.deleteById(cartDetailId);
        cart.setSum(cart.getSum() - 1);
        this.cartService.save(cart);
        session.setAttribute("cartSum", cart.getSum());
    }

    public void handleSaveCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            CartDetail currentCartDetail = this.cartDetaiRepository.findById(cartDetail.getId());
            if (currentCartDetail != null) {
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetaiRepository.save(currentCartDetail);
            }
        }
    }
}
