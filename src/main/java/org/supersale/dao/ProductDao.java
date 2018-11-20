package org.supersale.dao;

import org.apache.ibatis.annotations.Param;
import org.supersale.entity.Product;

import java.util.Date;
import java.util.List;

public interface ProductDao {

    /**
         *  減少庫存
         * @param productId
         * @param number
         * @return 表示更新的行數
         */
    int reduceNumber(@Param("productId") int productId, @Param("number") int number);

    /**
         * 根據id查詢搶購商品
         * @param productId
         * @return
         */
    Product getProductById(@Param("productId") int productId);

    /**
         * 取得所有的商品清單，用於後台管理
         * @return
         */
    List<Product> getProductList();

    /**
         * 取得活動中的商品清單
         * @param nowTime
         * @return
         */
    List<Product> getSellingList(@Param("nowTime") Date nowTime);

    /**
         * 取得即將開始活動的商品清單
         * @param nowTime
         * @return
         */
    List<Product> getUpcomingList(@Param("nowTime") Date nowTime);

    /**
        *  檢查時間及庫存，確認商品當前是否可販售
         * @param productId
         * @param nowTime
         * @return 商品是否可購買
         */
    Boolean isPurchasable(@Param("productId") int productId, @Param("nowTime") Date nowTime);

    /**
         *  新增商品
         * @param product
         * @return
         */
    int insertProduct(Product product);

    /**
         * 修改商品
         * @param product
         * @return
         */
    int updateProduct(Product product);

    /**
         * 刪除商品
         * @param productId
         * @return
         */
    int deleteProduct(@Param("productId") int productId);



}
