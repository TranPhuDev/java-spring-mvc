package vn.tranphudev.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.repository.ProductRepsitory;

@Service
public class ProductService {
    private final ProductRepsitory productRepsitory;

    public ProductService(ProductRepsitory productRepsitory) {
        this.productRepsitory = productRepsitory;
    }

    public List<Product> getAllProduct() {
        return this.productRepsitory.findAll();
    }

    // save product
    public Product handleSaveProduct(Product product) {
        Product newProduct = this.productRepsitory.save(product);
        return newProduct;
    }

    // detail product
    public Product handleDetailProduct(long id) {
        return this.productRepsitory.findById(id);
    }

    // delete product
    public void handleDeleteProduct(long id) {
        this.productRepsitory.deleteById(id);
    }

}
