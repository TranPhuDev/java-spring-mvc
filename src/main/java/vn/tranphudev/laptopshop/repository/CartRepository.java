package vn.tranphudev.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tranphudev.laptopshop.domain.Cart;
import vn.tranphudev.laptopshop.domain.User;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
