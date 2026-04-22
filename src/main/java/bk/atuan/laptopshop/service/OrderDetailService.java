package bk.atuan.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bk.atuan.laptopshop.domain.Order;
import bk.atuan.laptopshop.domain.OrderDetail;
import bk.atuan.laptopshop.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<OrderDetail> getOrderDetailByOrder(Order order) {
        return this.orderDetailRepository.findByOrder(order);
    }
}
