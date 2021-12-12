package com.store.jsa.models;

import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class InventoryEntry {
    private int invId;
    private int stockAmount;
    private int backOrderAmt;
    private Date nextShipmentDate;
    private int productId;

    public static RowMapper<InventoryEntry> mapper = (rs, i) -> {

        return InventoryEntry.builder()
        .invId(rs.getInt("INV_ID"))
        .stockAmount(rs.getInt("INV_STOCK_AMT"))
        .backOrderAmt(rs.getInt("INV_BACKORDER_AMT"))
        .nextShipmentDate(rs.getDate("INV_NEXT_SHIPMENT_DATE"))
        .productId(rs.getInt("PROD_ID"))
        .build();
    };
}
