package vn.tranphudev.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.tranphudev.laptopshop.domain.Cart;
import vn.tranphudev.laptopshop.domain.CartDetail;
import vn.tranphudev.laptopshop.domain.Order;
import vn.tranphudev.laptopshop.domain.OrderDetail;
import vn.tranphudev.laptopshop.domain.Product;
import vn.tranphudev.laptopshop.domain.User;
import vn.tranphudev.laptopshop.repository.CartDetailRepository;
import vn.tranphudev.laptopshop.repository.CartRepository;
import vn.tranphudev.laptopshop.repository.OrderDetailRepository;
import vn.tranphudev.laptopshop.repository.OrderRepository;
import vn.tranphudev.laptopshop.repository.ProductRepsitory;

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

    public List<Product> getAllProduct() {
        return this.productRepsitory.findAll();
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

    // order
    public void handleOlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {
        // create order
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");
                double sum = 0;
                for (CartDetail cartDetail : cartDetails) {
                    sum += cartDetail.getPrice() * cartDetail.getQuantity();
                }

                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // Create order detail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // Delete all cart details
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                // Delete the cart itself
                this.cartRepository.deleteById(cart.getId());

                // Update session
                session.setAttribute("sum", 0);
            }
        }
    }
}
