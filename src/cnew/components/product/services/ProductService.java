package cnew.components.product.services;

import cnew.components.product.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hjdeng on 4/3/17.
 */

@Service
public class ProductService {

    private Map<Integer, Product> products = new HashMap<>();

    private List<Product> generateProducts(int count) {
        List<Product> products = new ArrayList<>();
        for (int i = 1; i <= count; i++) {
            products.add(new Product(i, "Honda Civic Version " + i, 179900 + i));
        }

        return products;
    }

    private void init() {
        List<Product> products = this.generateProducts(20);
        products.forEach(product -> this.products.put(product.getId(), product));
    }

    public ProductService() {
        this.init();
    }

    public List<Product> getProducts() {
        return new ArrayList<>(this.products.values());
    }

    public Product getProduct(int id) {
        return this.products.get(id);
    }
}
