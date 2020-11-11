package com.task.no2;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * @className: one
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/11/2020
 **/
public class InFuture {

    static volatile Integer result;

    public static void main(String[] args) throws InterruptedException, ExecutionException {

        Long start = System.currentTimeMillis();
        // 在这里创建一个线程或线程池，
        ExecutorService executorService = Executors.newFixedThreadPool(1);
        // 异步执行 下面方法
        Future<Integer> fe = executorService.submit(InFuture::sum);
        executorService.shutdown();
        // 确保  拿到result 并输出
        result = fe.get();
        System.out.println("异步计算结果为：" + result);
        System.out.println("使用时间：" + (System.currentTimeMillis() - start) + " ms");
        // 然后退出main线程
    }

    private static int sum() {
        return fibo(36);
    }

    private static int fibo(int a) {
        if (a < 2)
            return 1;
        return fibo(a - 1) + fibo(a - 2);
    }
}
