package com.task.controller;

import com.task.entity.OrderEntity;
import com.task.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/save")
    public String save(@RequestParam("userId") Integer userId) {
        OrderEntity entity = new OrderEntity();
        entity.setUserId(userId);
        orderService.save(entity);
        return "ok";
    }

    @GetMapping()
    public String get() {
        OrderEntity orderEntity = orderService.get();
        return orderEntity.toString();
    }
}
