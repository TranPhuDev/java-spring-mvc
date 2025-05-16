package vn.tranphudev.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tranphudev.laptopshop.domain.Product;

public interface ProductRepsitory extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    Product findById(long id);

    Product deleteById(long id);
}
