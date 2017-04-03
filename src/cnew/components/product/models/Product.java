package cnew.components.product.models;

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

    public Product(int id, String description, float price) {
        this.id = id;
        this.description = description;
        this.price = price;
    }
}
