package vn.tranphudev.laptopshop.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.service.ProductService;

@Controller
public class itemController {

    private final ProductService productService;

    public itemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleDetailProduct(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "client/product/productDetail";
    }
}
