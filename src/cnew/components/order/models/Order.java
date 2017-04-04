package cnew.components.order.models;

import cnew.components.cart.models.Cart;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;

import java.io.Serializable;
import java.util.UUID;

/**
 * Created by hjdeng on 4/4/17.
 */
public class Order implements Serializable {

    private Cart cart;

    private UUID id;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    private String payUser;

    public String getPayUser() {
        return payUser;
    }

    public void setPayUser(String payUser) {
        this.payUser = payUser;
    }

    public Order() {
    }

    public Order(Cart cart, UUID id) {
        this.cart = cart;
        this.id = id;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public float getPayment() {
        boolean isCartEmpty = this.cart == null || this.cart.getItems().isEmpty();
        return isCartEmpty ? 0 : this.cart.getTotalPrice();
    }

    public boolean getHasPaid() {
        return this.payUser != null && !this.payUser.trim().equals("");
    }

    public void validateOrderPayment(ValidationContext context) {
        MessageContext messages = context.getMessageContext();
        if (!this.getHasPaid()) {
            messages.addMessage(new MessageBuilder().error().source("payUser").
                    defaultText("Pay user name can not be empty.").build());
        }
    }
}
