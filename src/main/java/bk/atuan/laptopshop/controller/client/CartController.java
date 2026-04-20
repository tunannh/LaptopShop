package bk.atuan.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.CartDetail;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.service.CartDetailService;
import bk.atuan.laptopshop.service.CartService;
import bk.atuan.laptopshop.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    private final CartDetailService cartDetailService;
    private final UserService userService;

    public CartController(CartService cartService, UserService userService, CartDetailService cartDetailService) {
        this.userService = userService;
        this.cartDetailService = cartDetailService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long userID = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userID);

        Cart cart = user.getCart();
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
        }
        List<CartDetail> cartDetails = cart.getCartDetails();
        double totalAmount = 0;
        if (cartDetails != null) {
            totalAmount = cartDetails.stream()
                    .mapToDouble(cd -> cd.getProduct().getPrice() * cd.getQuantity())
                    .sum();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("cart", cart);
        return "client/cart/showCart";
    }

    @PostMapping("/cart/remove/{cartDetailId}")
    public String removeCartDetail(@PathVariable("cartDetailId") long cartDetailId, HttpServletRequest request) {
        this.cartDetailService.handleRemoveCart(cartDetailId, request);

        return "redirect:/cart";
    }

    @PostMapping("/checkout-confirm")
    public String postCheckout(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart.getCartDetails();
        this.cartDetailService.handleSaveCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long userID = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userID);

        Cart cart = user.getCart();
        List<CartDetail> cartDetails = cart.getCartDetails();
        double totalAmount = 0;
        if (cartDetails != null) {
            totalAmount = cartDetails.stream()
                    .mapToDouble(cd -> cd.getProduct().getPrice() * cd.getQuantity())
                    .sum();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalAmount", totalAmount);
        return "client/cart/checkout";
    }

}
