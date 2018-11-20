package org.supersale.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.supersale.entity.Product;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告訴junit spring配置檔在哪
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ProductDaoTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ProductDao productDao;

    @Test
    public void reduceNumber() {

        int number = 2;
        int updateCount = productDao.reduceNumber(1, number);
        logger.info("updateCount= {}", updateCount);
    }
    @Test
    public void isPurchasable() {

        Date now = new Date();
        int productId=5;
        Boolean result = productDao.isPurchasable(productId, now);
        logger.info("商品是否正處於搶購時間內? {}", result);
    }

    @Test
    public void querySellingList() {

        Date now = new Date();
        List<Product> list = productDao.getSellingList(now);
        logger.info("搶購中的清單. {}", list);
    }

    @Test
    public void getUpcomingList() {

        Date now = new Date();
        List<Product> list = productDao.getUpcomingList(now);
        logger.info("預告清單. {}", list);
    }

    @Test
    public void getProductList() {

        List<Product> list = productDao.getProductList();
        logger.info("商品清單. {}", list);
    }

    @Test
    public void getProductById() {

        int id = 1;
        Product product = productDao.getProductById(id);
        logger.info("id: {} 的商品: {}", id, product);
    }

    @Test
    public void updateProduct() {

        Product product = new Product();
        product.setProductId(8);
        product.setName("測試");
        product.setNumber(100);
        product.setPrice(10000);
        product.setStartTime(new Date());
        product.setEndTime(new Date());
        productDao.updateProduct(product);
    }

    @Test
    public void insertProduct() {

        Product product = new Product();
        product.setName("Filco Ninja 黑軸");
        product.setPrice(2999);
        product.setNumber(10);
        SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.HOUR_OF_DAY,10);
        product.setStartTime(c.getTime());
        c.add(Calendar.DAY_OF_MONTH,1);
        product.setEndTime(c.getTime());
        logger.info("insert前的編號: {}", product.getProductId());
        productDao.insertProduct(product);
        logger.info("insert後的編號: {}", product.getProductId());
    }

    @Test
    public void deleteProduct() {
        int id = 9;
        productDao.deleteProduct(id);
    }
}