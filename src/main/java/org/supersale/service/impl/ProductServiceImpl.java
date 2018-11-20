package org.supersale.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.supersale.dao.ProductDao;
import org.supersale.entity.Product;
import org.supersale.service.ProductService;

import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public List<Product> getSellingList(Date nowTime) {
        return productDao.getSellingList(nowTime);
    }

    public List<Product> getUpcomingList(Date nowTime) {
        return productDao.getUpcomingList(nowTime);
    }

    public List<Product> getProductList() {
        return productDao.getProductList();
    }

    public Product getProductById(int productId) {

        return productDao.getProductById(productId);
    }

    public int updateProduct(Product product) {
        return productDao.updateProduct(product);
//        return productDao.updateProduct(productId, name, number, price, startTime, endTime);
    }

    public int insertProduct(Product product) {
//        return  productDao.insertProduct(name, number, price, startTime, endTime);
        return productDao.insertProduct(product);
    }

    public int deleteProduct(int productId) {
        return productDao.deleteProduct(productId);
    }
}
