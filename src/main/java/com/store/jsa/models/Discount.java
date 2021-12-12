package com.store.jsa.models;

import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class Discount {
    private int discountId;
    private String discountCode;
    private Date discountExpiry;
    private boolean discountRedeemed;
    private double discountAmount;

    public static RowMapper<Discount> mapper = (rs, i) -> {

        return Discount.builder()
        .discountId(rs.getInt("DISC_ID"))
        .discountCode(rs.getString("DISC_CODE"))
        .discountExpiry(rs.getDate("DISC_EXPIRY"))
        .discountRedeemed(rs.getBoolean("DISC_REDEEMED"))
        .discountAmount(rs.getDouble("DISC_AMT"))
        .build();
    };
}
