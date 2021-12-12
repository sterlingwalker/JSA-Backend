package com.store.jsa.models;

import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class Sale {
    private int saleId;
    private Date saleDate;
    private double saleAmount;
    private double saleTax;
    private String saleType;
    private int productId;
    private int customerId;
    private double saleCommission;
    private int employeeId;
    private double saleDiscount;
    private int discountId;

    public static RowMapper<Sale> mapper = (rs, i) -> {
        
        return Sale.builder()
        .saleId(rs.getInt("SALE_ID"))
        .saleDate(rs.getDate("SALE_DATE"))
        .saleAmount(rs.getDouble("SALE_AMOUNT"))
        .saleTax(rs.getDouble("SALE_TAX"))
        .saleType(rs.getString("SALE_TYPE"))
        .productId(rs.getInt("PROD_ID"))
        .customerId(rs.getInt("CUST_ID"))
        .saleCommission(rs.getDouble("SALE_COMMISSION"))
        .employeeId(rs.getInt("EMP_ID"))
        .saleDiscount(rs.getDouble("SALE_DISCOUNT"))
        .discountId(rs.getInt("DISC_ID"))
        .build();
    };
    
}
