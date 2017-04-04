package cnew.components.order.services;

import cnew.components.cart.models.Cart;
import cnew.components.order.models.Order;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.UUID;

/**
 * Created by hjdeng on 4/4/17.
 */
@Service
public class OrderService {
    public Order newOrder(Cart cart) {
        return new Order(cart, UUID.randomUUID());
    }
}
