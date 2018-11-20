package org.supersale.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.supersale.dao.ProductDao;
import org.supersale.dao.ShoppingOrderDao;
import org.supersale.entity.ShoppingOrder;
import org.supersale.exception.SuperSaleCloseException;
import org.supersale.exception.SuperSaleException;
import org.supersale.exception.UnderstockException;
import org.supersale.service.SuperSaleService;

import java.util.Date;
import java.util.List;

@Service
public class SuperSaleServiceImpl implements SuperSaleService {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ShoppingOrderDao shoppingOrderDao;

    public ShoppingOrder getOrderById(int orderId) {

        ShoppingOrder order = shoppingOrderDao.getOrderById(orderId);
        return order;
    }

    public List<ShoppingOrder> getOrderList(int customerId) {

        List<ShoppingOrder> orderList = shoppingOrderDao.getOrderList(customerId);
        return orderList;
    }

    public ShoppingOrder executePurchase(ShoppingOrder shoppingOrder, int productId) {

        Date nowTime = new Date();
        //1.確認商品是否正處於搶購時間 & 庫存是否大於0
        //2.減少庫存
        //3.插入訂單
        try {
            if (!productDao.isPurchasable(productId, nowTime)) {
                throw new SuperSaleCloseException("搶購已結束");
            } else {
                int updateCount = productDao.reduceNumber(productId, shoppingOrder.getNumber());
                if (updateCount <= 0) {
                    throw new UnderstockException("庫存不足");
                }
            }
            shoppingOrder.setCreateTime(nowTime);

            shoppingOrderDao.insertOrder(shoppingOrder);
            return shoppingOrder;
        } catch (SuperSaleCloseException e1) {
            throw e1;
        } catch (UnderstockException e2) {
            throw e2;
        } catch (Exception e) {
            throw new SuperSaleException("SuperSale inner error: " + e.getMessage());
        }
    }
}
