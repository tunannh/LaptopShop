package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.CartDetail;
import bk.atuan.laptopshop.domain.Order;
import bk.atuan.laptopshop.domain.OrderDetail;
import bk.atuan.laptopshop.domain.User;
import bk.atuan.laptopshop.repository.CartDetailRepository;
import bk.atuan.laptopshop.repository.CartRepository;
import bk.atuan.laptopshop.repository.OrderDetailRepository;
import bk.atuan.laptopshop.repository.OrderRepository;
import jakarta.servlet.http.HttpSession;

@Service
public class OrderService {
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(CartRepository cartRepository, CartDetailRepository cartDetailRepository,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order save(Order order) {
        if (order == null) {
            return null;
        }
        return this.orderRepository.save(order);
    }

    public void handlePlaceOrder(User user, String receiverName, String receiverEmail, String receiverAddress,
            String receiverPhone,
            HttpSession session) {
        Cart cart = this.cartRepository.findByUser(user);
        List<CartDetail> cartDetails = cart.getCartDetails();
        if (cartDetails == null || cartDetails.isEmpty()) {
            return;
        }
        double totalAmount = 0;
        if (cartDetails != null) {
            totalAmount = cartDetails.stream()
                    .mapToDouble(cd -> cd.getProduct().getPrice() * cd.getQuantity())
                    .sum();
        }
        // tạo order
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName);
        order.setReceiverEmail(receiverEmail);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order.setQuantity(cart.getSum());
        order.setTotalPrice(totalAmount);
        order.setStatus("PENDING");
        order = this.orderRepository.save(order);

        // tạo order detail
        for (CartDetail cartDetail : cartDetails) {
            // tạo order detail
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(cartDetail.getProduct());
            orderDetail.setQuantity(cartDetail.getQuantity());
            orderDetail.setPrice(cartDetail.getProduct().getPrice());
            orderDetail.setTotal(cartDetail.getProduct().getPrice() * cartDetail.getQuantity());
            cartDetail.getProduct().setQuantity(cartDetail.getProduct().getQuantity() - cartDetail.getQuantity());
            cartDetail.getProduct().setSold(cartDetail.getProduct().getSold() + cartDetail.getQuantity());
            this.orderDetailRepository.save(orderDetail);
        }
        // xóa cart detail
        cart.setSum(0);
        this.cartRepository.save(cart);
        session.setAttribute("cartSum", 0);
        this.cartDetailRepository.deleteAll(cartDetails);
    }

    public void handleDeleteOrder(long orderId) {
        Order order = this.orderRepository.findById(orderId);
        if (order == null) {
            return;
        }
        List<OrderDetail> orderDetails = this.orderDetailRepository.findByOrder(order);
        if (orderDetails != null) {
            this.orderDetailRepository.deleteAll(orderDetails);
        }
        this.orderRepository.delete(order);
    }
}
