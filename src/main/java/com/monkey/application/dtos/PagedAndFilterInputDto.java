package com.monkey.application.dtos;


import java.util.List;
import java.util.Map;

public class PagedAndFilterInputDto  {

    public  PagedAndFilterInputDto(){}
    public  PagedAndFilterInputDto(Integer s,Integer t,Map<String,Object> f){
        this.index=s;
        this.size=t;
        this.where=f;
    }

    public  Integer index=1;
    public  Integer size=10;
    public Map<String,Object> where;
}
