package bk.atuan.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import bk.atuan.laptopshop.domain.Order;
import bk.atuan.laptopshop.domain.OrderDetail;
import bk.atuan.laptopshop.service.OrderDetailService;
import bk.atuan.laptopshop.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ManageOrderController {
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public ManageOrderController(OrderService orderService, OrderDetailService orderDetailService) {
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> listOrders = this.orderService.getAllOrders();
        model.addAttribute("listOrders", listOrders);
        return "admin/order/order";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(@PathVariable long id, Model model) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        List<OrderDetail> orderDetails = this.orderDetailService.getOrderDetailByOrder(order);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/order-detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(@PathVariable long id, Model model) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        model.addAttribute("id", id);
        return "admin/order/update-order";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(@ModelAttribute("order") Order order) {
        Order existingOrder = this.orderService.getOrderById(order.getId());
        if (existingOrder != null) {
            existingOrder.setStatus(order.getStatus());
            this.orderService.save(existingOrder);
        }
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(@PathVariable long id, Model model) {
        Order order = new Order();
        order.setId(id);
        model.addAttribute("order", order);
        return "admin/order/delete-order";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("order") Order order) {
        this.orderService.handleDeleteOrder(order.getId());
        return "redirect:/admin/order";
    }

}
