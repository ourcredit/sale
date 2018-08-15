package com.monkey.web.controller.dtos;
public class WebSocketMessage {
    public WebSocketMessage(){}
    public WebSocketMessage(String to, String order, String message, Integer type, Boolean state){
        this.to=to;
        this.message=message;
        this.order=order;
        this.type=type;
        this.state=state;
    }
    public String to;
    public  String order;
    public  Integer type;
    public Boolean state;
    public  String message;
}
