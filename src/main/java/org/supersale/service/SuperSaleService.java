package org.supersale.service;

import org.supersale.entity.ShoppingOrder;

import java.util.List;

public interface SuperSaleService {

    ShoppingOrder executePurchase(ShoppingOrder shoppingOrder, int productId);

    ShoppingOrder getOrderById(int orderId);

    List<ShoppingOrder> getOrderList(int customerId);

}
