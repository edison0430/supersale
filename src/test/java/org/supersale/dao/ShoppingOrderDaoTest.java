package org.supersale.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.supersale.entity.ShoppingOrder;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ShoppingOrderDaoTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ShoppingOrderDao ordershoppingOrderDao;

    @Test
    public void insertOrders() {

        ShoppingOrder shoppingOrder = new ShoppingOrder();
        shoppingOrder.setProductName("iPhone X");
        shoppingOrder.setNumber(1);
        shoppingOrder.setPrice(5000);
        shoppingOrder.setPayment("CASH");
        shoppingOrder.setMemberId(1);
        shoppingOrder.setBuyerName("張三");
        shoppingOrder.setBuyerPhone("0977777777");
        shoppingOrder.setBuyerAddress("台灣");
        shoppingOrder.setReceiverName("張三");
        shoppingOrder.setReceiverPhone("0977777777");
        shoppingOrder.setReceiverAddress("台灣");
        shoppingOrder.setRemark("it's test");
        shoppingOrder.setCreateTime(new Date());
        logger.info("insert前的編號: {}", shoppingOrder.getOrderId());
        ordershoppingOrderDao.insertOrder(shoppingOrder);
        logger.info("insert後的編號: {}", shoppingOrder.getOrderId());
    }

    @Test
    public void getOrderList() {

        int customerId = 2;
        List<ShoppingOrder> orderList = ordershoppingOrderDao.getOrderList(customerId);
        logger.info("orderList: {}" , orderList);
    }

    @Test
    public void getOrderById() {

        int orderId = 19;
        ShoppingOrder order = ordershoppingOrderDao.getOrderById(orderId);
        logger.info("order: {}" , order);
    }
}