package org.supersale.exception;

/**
 * 庫存不足Exception
 */
public class UnderstockException extends SuperSaleException {

    public UnderstockException(String message) {
        super(message);
    }
}
