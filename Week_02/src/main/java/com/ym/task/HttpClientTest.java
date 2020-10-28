package com.ym.task;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * @className: HttpClientTest
 * @description: TODO 类描述
 * @author: YM
 * @date: 10/28/2020
 **/
public class HttpClientTest {
    public static void main(String[] args) {
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet("http://localhost:8801/");
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            System.out.println("Response Status: " + response.getStatusLine());
            if (entity != null) {
                System.out.println("Response Length: " + entity.getContentLength());
                System.out.println("Response Context: " + EntityUtils.toString(entity));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
