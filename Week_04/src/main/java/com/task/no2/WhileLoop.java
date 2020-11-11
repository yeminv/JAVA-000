package com.task.no2;

/**
 * @className: one
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/11/2020
 **/
public class WhileLoop {

    static volatile Integer result;

    public static void main(String[] args) {

        long start = System.currentTimeMillis();
        // 在这里创建一个线程或线程池，
        // 异步执行 下面方法
        new Thread(() -> result = sum()).start();
        while (true){
            if (result != null){
                // 确保  拿到result 并输出
                System.out.println("异步计算结果为：" + result);
                System.out.println("使用时间：" + (System.currentTimeMillis() - start) + " ms");
                break;
            }
        }

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
