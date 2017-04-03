package cnew.components.cart.models;

import cnew.components.product.models.Product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hjdeng on 4/3/17.
 */
public class Cart implements Serializable {

    private Map<Integer, CartItem> cartItems = new HashMap<>();

    private int getProductQuantity(int id) {
        CartItem targetItem = this.cartItems.get(id);
        return targetItem == null ? 0 : targetItem.getQuantity();
    }

    public List<CartItem> getItems() {
        return new ArrayList<>(cartItems.values());
    }

    public void addItem(Product product) {
        int id = product.getId();
        CartItem item = cartItems.get(id);
        if (item != null) {
            item.increaseQuantity();
        } else {
            cartItems.put(id, new CartItem(product, 1));
        }
    }

    public float getTotalPrice() {
        float total = 0;
        for (CartItem item : cartItems.values()) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }

        return total;
    }

    public String getProductQuantityFormat(int id) {
        int qty = this.getProductQuantity(id);
        return qty == 0 ? "+" : "+" + qty;
    }
}