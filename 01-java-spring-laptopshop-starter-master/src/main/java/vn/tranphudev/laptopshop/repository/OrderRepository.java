package vn.tranphudev.laptopshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import vn.tranphudev.laptopshop.domain.Order;
import vn.tranphudev.laptopshop.domain.User;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable);

    Optional<Order> findByPaymentRef(String paymentRef);
}
