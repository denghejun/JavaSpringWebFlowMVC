package cnew.components.product.models;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;

import java.io.Serializable;

/**
 * Created by hjdeng on 4/3/17.
 */
public class Product implements Serializable {

    private int id;

    private String description;

    private float price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Product() {
    }

    public Product(int id, String description, float price) {
        this.id = id;
        this.description = description;
        this.price = price;
    }

    public void validateViewOrder(ValidationContext context) {
        MessageContext messages = context.getMessageContext();
        if (this.description.trim().isEmpty()) {
            messages.addMessage(new MessageBuilder().error().source("description").
                    defaultText("Description can not be empty.").build());
        }

        if (this.price <= 0) {
            messages.addMessage(new MessageBuilder().error().source("price").
                    defaultText("Price must be greater than zero.").build());
        }
    }
}
