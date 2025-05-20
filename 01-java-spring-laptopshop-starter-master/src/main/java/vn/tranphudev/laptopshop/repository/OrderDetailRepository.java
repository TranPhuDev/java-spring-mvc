package vn.tranphudev.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tranphudev.laptopshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
