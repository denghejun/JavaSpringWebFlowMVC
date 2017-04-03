package cnew.components.cart.models;

import cnew.components.product.models.Product;

import java.io.Serializable;

/**
 * Created by hjdeng on 4/3/17.
 */
public class CartItem implements Serializable {

    private Product product;

    private int quantity;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public float getTotalPrice() {
        return this.quantity * this.product.getPrice();
    }

    public void increaseQuantity() {
        this.quantity++;
    }
}
