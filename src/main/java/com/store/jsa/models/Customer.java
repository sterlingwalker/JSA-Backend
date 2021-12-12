package com.store.jsa.models;

import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class Customer {
    private int customerId;
    private String cusFname;
    private String cusLname;
    private Date cusDOB;
    private String cusGender;
    private String cusPhone;
    private String cusAddr;
    
    public static RowMapper<Customer> mapper = (rs, i) -> {

      return  Customer.builder()
        .customerId(rs.getInt("CUST_ID"))
        .cusFname(rs.getString("CUST_FNAME"))
        .cusLname(rs.getString("CUST_LNAME"))
        .cusDOB(rs.getDate("CUST_DOB"))
        .cusGender(rs.getString("CUST_GENDER"))
        .cusPhone(rs.getString("CUST_PHONE"))
        .cusAddr(rs.getString("CUST_ADDR"))
        .build();
    };
}
