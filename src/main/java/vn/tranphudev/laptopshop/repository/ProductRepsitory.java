package vn.tranphudev.laptopshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import vn.tranphudev.laptopshop.domain.Product;

public interface ProductRepsitory extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Product save(Product product);

    List<Product> findAll();

    Optional<Product> findById(long id);

    Product deleteById(long id);

    Page<Product> findAll(Specification<Product> spec, Pageable page);
}
