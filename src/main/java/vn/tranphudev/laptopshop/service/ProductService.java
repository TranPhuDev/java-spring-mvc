package vn.tranphudev.laptopshop.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.servlet.http.HttpSession;
import vn.tranphudev.laptopshop.domain.Cart;
import vn.tranphudev.laptopshop.domain.CartDetail;
import vn.tranphudev.laptopshop.domain.Order;
import vn.tranphudev.laptopshop.domain.OrderDetail;
import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.domain.Product_;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.domain.DTO.ProductCriteriaDTO;
import vn.tranphudev.laptopshop.repository.CartDetailRepository;
import vn.tranphudev.laptopshop.repository.CartRepository;
import vn.tranphudev.laptopshop.repository.OrderDetailRepository;
import vn.tranphudev.laptopshop.repository.OrderRepository;
import vn.tranphudev.laptopshop.repository.ProductRepsitory;
import vn.tranphudev.laptopshop.service.specification.ProductSpec;

@Service
public class ProductService {
    private final ProductRepsitory productRepsitory;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepsitory productRepsitory, CartDetailRepository cartDetailRepositpry,
            CartRepository cartRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepsitory = productRepsitory;
        this.cartDetailRepository = cartDetailRepositpry;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public Page<Product> getAllProduct(Pageable page) {
        return this.productRepsitory.findAll(page);
    }

    // search by name
    public Page<Product> getAllProductWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepsitory.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpec.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpec.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        return this.productRepsitory.findAll(combinedSpec, page);
    }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;

            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpec.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    // save product
    public Product handleSaveProduct(Product product) {
        Product newProduct = this.productRepsitory.save(product);
        return newProduct;
    }

    // detail product
    public Optional<Product> handleDetailProduct(long id) {
        return this.productRepsitory.findById(id);
    }

    // delete product
    public void handleDeleteProduct(long id) {
        this.productRepsitory.deleteById(id);
    }

    // add product to cart
    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user co cart chua
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // luu cart detail
            // tim pro duct
            Optional<Product> producOptional = this.productRepsitory.findById(productId);
            if (producOptional.isPresent()) {
                Product realProduct = producOptional.get();

                // check sp co trong cart hay chua
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realProduct);
                    cartDetail.setPrice(realProduct.getPrice());
                    cartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(cartDetail);

                    // update cart sum
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }
    }

    // get detail cart
    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    // delete cart detail
    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }

    }

    // cart before checkout
    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    @Transactional
    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone, String paymentMethod, String uuid) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null && !cartDetails.isEmpty()) {
                try {
                    // create order
                    Order order = new Order();
                    order.setUser(user);
                    order.setReceiverName(receiverName);
                    order.setReceiverAddress(receiverAddress);
                    order.setReceiverPhone(receiverPhone);
                    order.setStatus("PENDING");
                    order.setPaymentMethod(paymentMethod);
                    order.setPaymentStatus("PAYMENT_UNPAID");
                    order.setPaymentRef(paymentMethod.equals("COD") ? "UNKNOWN" : uuid);

                    double sum = cartDetails.stream()
                            .mapToDouble(CartDetail::getPrice)
                            .sum();
                    order.setTotalPrice(sum);
                    order = this.orderRepository.save(order);

                    // create orderDetail
                    for (CartDetail cd : cartDetails) {
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setOrder(order);
                        orderDetail.setProduct(cd.getProduct());
                        orderDetail.setPrice(cd.getPrice());
                        orderDetail.setQuantity(cd.getQuantity());
                        this.orderDetailRepository.save(orderDetail);
                    }

                    // step 2: delete cart_detail and cart
                    for (CartDetail cd : cartDetails) {
                        this.cartDetailRepository.deleteById(cd.getId());
                    }
                    this.cartRepository.deleteById(cart.getId());

                    // step 3: update session
                    session.removeAttribute("cart");
                } catch (Exception e) {
                    throw new RuntimeException("Error processing order: " + e.getMessage(), e);
                }
            }
        }
    }

    public void updatePaymentStatus(String paymentRef, String paymentStatus) {
        Optional<Order> orderOptional = this.orderRepository.findByPaymentRef(paymentRef);
        if (orderOptional.isPresent()) {
            // update
            Order order = orderOptional.get();
            order.setPaymentStatus(paymentStatus);
            this.orderRepository.save(order);
        }
    }
}
