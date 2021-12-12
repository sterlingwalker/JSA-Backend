package com.store.jsa.models;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class CartEntry {
    private int customerId;
    private int productId;

    public static RowMapper<CartEntry> mapper = (rs, i) -> {

        return CartEntry.builder()
        .customerId(rs.getInt("CUS_ID"))
        .productId(rs.getInt("PROD_ID"))
        .build();
    };
    
}
