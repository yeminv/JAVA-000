package io.github.kimmking.gateway.filter;

import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.FullHttpRequest;

/**
 * @className: HttpRequestHeaderFilter
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/4/2020
 **/
public class HttpRequestHeaderFilter implements HttpRequestFilter{
    @Override
    public void filter(FullHttpRequest fullRequest, ChannelHandlerContext ctx) {
        fullRequest.headers().set("nio", "Ye Min");
    }
}
