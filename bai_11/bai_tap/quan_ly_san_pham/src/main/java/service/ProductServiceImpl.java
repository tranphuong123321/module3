package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService{
    //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
    private static Map<Integer, Product> products;
    static{
        products=new HashMap<>();
        products.put(1, new Product(1,"iphone",5000000,"con hang","apple"));
        products.put(2, new Product(2,"samsung",6000000,"het hang","samsung"));
        products.put(3, new Product(3,"nokia",7000000,"het hang","nokia"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(Integer id) {

        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
