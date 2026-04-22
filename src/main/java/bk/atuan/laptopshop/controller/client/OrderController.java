package bk.atuan.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bk.atuan.laptopshop.domain.Order;
import bk.atuan.laptopshop.domain.OrderDetail;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.service.OrderService;
import bk.atuan.laptopshop.service.ProductService;
import bk.atuan.laptopshop.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;
    private final ProductService productService;

    public OrderController(OrderService orderService, UserService userService, ProductService productService) {
        this.orderService = orderService;
        this.userService = userService;
        this.productService = productService;
    }

    @PostMapping("/place-order")
    public String postPlaceOrder(HttpServletRequest request, @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverEmail") String receiverEmail,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession();
        long userId = (long) session.getAttribute("id");
        User user = new User();
        user.setId(userId);
        this.orderService.handlePlaceOrder(user, receiverName, receiverEmail, receiverAddress, receiverPhone, session);
        return "redirect:/success";
    }

    @GetMapping("/success")
    public String getSuccessPage() {
        return "client/cart/success";
    }

    @GetMapping("/order-history")
    public String getOrderHistory(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long userId = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userId);
        List<Order> orders = user.getOrders();
        model.addAttribute("orders", orders);
        return "client/order/order-history";
    }

    @GetMapping("/order-history/{id}")
    public String getOrderHistoryDetail(Model model, @PathVariable("id") long orderId) {
        Order order = this.orderService.getOrderById(orderId);
        List<OrderDetail> orderDetails = order.getOrderDtails();
        model.addAttribute("orderDetails", orderDetails);
        return "client/order/order-history-detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addToCart(@PathVariable("id") long productId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        this.productService.handleAddProductToCart(productId, 1, session);
        return "redirect:/";
    }

    @PostMapping("/add-to-cart-from-product-detail")
    public String postMethodName(@RequestParam("id") long productId, @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        this.productService.handleAddProductToCart(productId, quantity, session);
        return "redirect:/product/" + productId;
    }

}
