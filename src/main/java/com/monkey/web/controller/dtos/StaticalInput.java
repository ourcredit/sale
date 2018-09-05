package com.monkey.web.controller.dtos;

import java.util.Date;

public class StaticalInput {
    public String deviceName;
    public String pointName;
    public String productName;
    public Date start;
    public Date end;
    private Integer tenantId;

    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
}
