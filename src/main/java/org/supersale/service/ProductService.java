package org.supersale.service;

import org.supersale.entity.Product;

import java.util.Date;
import java.util.List;

public interface ProductService {

    List<Product> getProductList();

    List<Product> getSellingList(Date nowTime);

    List<Product> getUpcomingList(Date nowTime);

    Product getProductById(int productId);

    int updateProduct(Product product);

    int insertProduct(Product product);

    int deleteProduct(int productId);
}
