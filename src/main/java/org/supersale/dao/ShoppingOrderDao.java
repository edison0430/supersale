package org.supersale.dao;

import org.apache.ibatis.annotations.Param;
import org.supersale.entity.ShoppingOrder;

import java.util.List;

public interface ShoppingOrderDao {

    /**
         * 新增訂單
         * @param shoppingOrder
         * @return
         */
    int insertOrder(ShoppingOrder shoppingOrder);

    /**
         * 根據訂單編號查詢訂單資料
         * @param orderId
         * @return
         */
    ShoppingOrder getOrderById(@Param("orderId") int orderId);

    /**
         * 取得訂單清單
         * @param memberId
         * @return
         */
    List<ShoppingOrder> getOrderList(@Param("memberId") int memberId);
}
