package com.ym.task;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * @className: HelloClassLoader
 * @description: TODO 类描述
 * @author: YM
 * @date: 10/19/2020
 **/
public class HelloClassLoader extends ClassLoader {
    public static void main(String[] args) {
        try {
            Object hello = new HelloClassLoader().findClass("Hello").newInstance();
            hello.getClass().getMethod("hello").invoke(hello);
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException | NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        byte[] bytes = new byte[0];
        try {
            //byte[] sourceByte = Files.readAllBytes(Paths.get("C:\\MyResources\\TestProjects\\JVM\\bytecode\\src\\Hello.xlass"));
            bytes = Files.readAllBytes(Paths.get("Week_01/src/main/resources/Hello.xlass"));
            for (int i = 0; i < bytes.length; i++) {
                bytes[i] = (byte) (255 - bytes[i]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return defineClass(name, bytes, 0, bytes.length);
    }
}