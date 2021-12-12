package com.store.jsa.models;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class Product {
    private int productId;
    private String productType;
    private double productPrice;
    private String productColor;
    private int brandID;
    private String brandName;
    private String brandSpecialty;
    private int clothId;
    private String clothSize;
    private String clothMaterial;
    private String clothGender;
    private int accId;
    private String accName;
    private String accType;
    private String accSize;
    private String accWeight;

    public static RowMapper<Product> mapper = (rs, i) -> {

        return Product.builder()
        .productId(rs.getInt("PROD_ID"))
        .productType(rs.getString("PROD_TYPE"))
        .productPrice(rs.getDouble("PROD_PRICE"))
        .productColor(rs.getString("PROD_COLOR"))
        .brandID(rs.getInt("BRAND_ID"))
        .brandName(rs.getString("BRAND_NAME"))
        .brandSpecialty(rs.getString("BRAND_SPECIALTY"))
        .clothId(rs.getInt("CLOTH_ID"))
        .clothSize(rs.getString("CLOTH_SIZE"))
        .clothMaterial(rs.getString("CLOTH_MATERIAL"))
        .clothGender(rs.getString("CLOTH_GENDER"))
        .accId(rs.getInt("ACC_ID"))
        .accName(rs.getString("ACC_NAME"))
        .accType(rs.getString("ACC_TYPE"))
        .accSize(rs.getString("ACC_SIZE"))
        .accWeight(rs.getString("ACC_WEIGHT"))
        .build();
    };
    
}
