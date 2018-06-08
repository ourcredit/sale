package com.monkey.application.dtos;


import com.baomidou.mybatisplus.plugins.Page;

public class PagedAndFilterInputDto<T>  {

    public  PagedAndFilterInputDto(){}
    public  PagedAndFilterInputDto(Integer s,Integer t,String f){
        this.index=s;
        this.size=t;
        this.filter=f;
    }

    public  Integer index=1;
    public  Integer size=10;
    public  String filter="";
    private Page<T>  _page=new Page<T>(this.index,this.size);


    public Page<T> get_page() {
        return _page;
    }

    public void set_page(Page<T> _page) {
        this._page = _page;
    }
}
