package com.store.jsa.models;

import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
public class Employee {
    private int employeeId;
    private String empFname;
    private String empLname;
    private Date empDOB;
    private String empGender;
    private String empPhone;
    private String empAddr;

    public static RowMapper<Employee> mapper = (rs, i) -> {

        return  Employee.builder()
          .employeeId(rs.getInt("EMP_ID"))
          .empFname(rs.getString("EMP_FNAME"))
          .empLname(rs.getString("EMP_LNAME"))
          .empDOB(rs.getDate("EMP_DOB"))
          .empGender(rs.getString("EMP_GENDER"))
          .empPhone(rs.getString("EMP_PHONE"))
          .empAddr(rs.getString("EMP_ADDR"))
          .build();
      };
    
}
