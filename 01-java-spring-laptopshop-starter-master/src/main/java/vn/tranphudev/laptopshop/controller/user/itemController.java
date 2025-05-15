package vn.tranphudev.laptopshop.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class itemController {
    @GetMapping("/product/{id}")
    public String getProductDetailPage(@PathVariable long id) {
        return "client/product/productDetail";
    }
}
