package com.task.service;

import com.task.entity.OrderEntity;
import com.task.repository.OrderRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

/**
 * @author ChengJianSheng
 * @date 2020-06-18
 */
@Service
public class OrderService {

    @Resource
    private OrderRepository orderRepository;

    public void save(OrderEntity entity) {
        orderRepository.save(entity);
    }

    public OrderEntity get() {
        return orderRepository.findAll().get(0);
    }

}
