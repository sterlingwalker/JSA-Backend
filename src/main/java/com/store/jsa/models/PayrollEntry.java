package com.store.jsa.models;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class PayrollEntry {
    private int employeeId;
    private double payRate;
    private int hoursWorked;
    private double empCommission;
    private double payTotal;

    public static RowMapper<PayrollEntry> mapper = (rs, i) -> {

        return PayrollEntry.builder()
        .employeeId(rs.getInt("EMP_ID"))
        .payRate(rs.getDouble("PAY_RATE"))
        .hoursWorked(rs.getInt("PAY_HRS_WRK"))
        .empCommission(rs.getDouble("PAY_COMMISSION"))
        .payTotal(rs.getDouble("PAY_TOTAL"))
        .build();
    };
    
}
