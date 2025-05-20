package vn.tranphudev.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tranphudev.laptopshop.domain.Cart;
import vn.tranphudev.laptopshop.domain.CartDetail;
import vn.tranphudev.laptopshop.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findAll();

}
