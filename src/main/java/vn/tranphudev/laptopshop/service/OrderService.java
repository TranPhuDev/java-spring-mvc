package vn.tranphudev.laptopshop.service;

import java.util.List;
import java.util.Optional;
import java.util.Map;
import java.util.HashMap;
import java.time.LocalDateTime;
import java.time.Month;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.tranphudev.laptopshop.domain.Order;
import vn.tranphudev.laptopshop.domain.OrderDetail;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.repository.OrderDetailRepository;
import vn.tranphudev.laptopshop.repository.OrderRepository;

@Service
@Transactional
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public List<Order> getRecentOrders(int limit) {
        return this.orderRepository.findAll(Sort.by(Sort.Direction.DESC, "id")).subList(0,
                Math.min(limit, (int) this.orderRepository.count()));
    }

    @Transactional(readOnly = true)
    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    @Transactional
    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            this.orderRepository.deleteById(id);
        }
    }

    @Transactional
    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    @Transactional(readOnly = true)
    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Transactional(readOnly = true)
    public List<Order> findByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Transactional(readOnly = true)
    public double calculateTotalRevenue() {
        List<Order> allOrders = this.orderRepository.findAll();
        return allOrders.stream()
                .filter(order -> "COMPLETE".equals(order.getStatus()))
                .mapToDouble(Order::getTotalPrice)
                .sum();
    }

}
