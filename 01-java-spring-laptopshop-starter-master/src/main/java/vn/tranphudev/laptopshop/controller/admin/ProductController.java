package vn.tranphudev.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.service.ProductService;
import vn.tranphudev.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;

    private final UploadService uploadService;

    public ProductController(UploadService uploadService, ProductService productService) {

        this.uploadService = uploadService;

        this.productService = productService;

    }

    // Product list
    @GetMapping("/admin/product")
    public String getProduct(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> products = this.productService.getAllProduct(pageable);
        List<Product> listProducts = products.getContent();
        model.addAttribute("product", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/product/showProduct";
    }

    // UI Create
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // Logic create
    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult producBindingResult,
            @RequestParam("uploadFile") MultipartFile file, RedirectAttributes redirectAttributes) {

        List<FieldError> errors = producBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (producBindingResult.hasErrors()) {
            return "/admin/product/create";
        }

        String productImg = this.uploadService.handelSaveUploadFile(file, "product");

        product.setImage(productImg);
        System.out.println("Check img" + productImg);
        this.productService.handleSaveProduct(product);
        redirectAttributes.addFlashAttribute("successMessage", "Product created successfully!");
        return "redirect:/admin/product";
    }

    // UI view detail product
    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleDetailProduct(id).get();
        model.addAttribute("id", id);
        model.addAttribute("product", product);

        return "admin/product/productDetail";
    }

    // UI Update product
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.handleDetailProduct(id).get();
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/productUpdate";
    }

    // logic update
    @PostMapping("/admin/product/update/{id}")
    public String postUpdateProduct(Model model, @PathVariable long id,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult productBindingResult,
            @RequestParam("uploadFile") MultipartFile file, RedirectAttributes redirectAttributes) {

        List<FieldError> errors = productBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (productBindingResult.hasErrors()) {
            return "admin/product/productUpdate";
        }

        Product currentProduct = this.productService.handleDetailProduct(product.getId()).get();
        String productImg = this.uploadService.handelSaveUploadFile(file, "product");

        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String img = this.uploadService.handelSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setSold(product.getSold());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            if (!productImg.isEmpty()) {
                currentProduct.setImage(productImg);
            }
            this.productService.handleSaveProduct(currentProduct);
            redirectAttributes.addFlashAttribute("successMessage", "Product updated successfully!");
        }
        return "redirect:/admin/product";
    }

    // UI Delete product
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleDetailProduct(id).get();
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    // Logic Delete product
    @PostMapping("/admin/product/delete/{id}")
    public String handleDeleteProduct(@PathVariable long id, @ModelAttribute("newProduct") Product pr,
            RedirectAttributes redirectAttributes) {
        this.productService.handleDeleteProduct(pr.getId());
        redirectAttributes.addFlashAttribute("successMessage", "Product deleted successfully!");
        return "redirect:/admin/product";
    }
}
