//package com.cyber.filter;
//
//import redis.clients.jedis.ShardedJedis;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import java.io.BufferedReader;
//import java.io.IOException;
//
//@WebFilter(urlPatterns = "/toviewOne/*", filterName = "hotPoint")
//public class RankingResourceFilter implements Filter {
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        String id = null;
//        HttpServletRequest request = (HttpServletRequest)servletRequest;;
//        if("GET".equalsIgnoreCase(request.getMethod())) {
//            id = this.getBodyString(request.getReader());
//            System.out.println(id);
//        }
//        ShardedJedis jedis = BootUtils.pool.getResource();
//        if (jedis.exists("resource_id_" + id)) {
//            jedis.set("resource_id_"+id,Integer.parseInt(jedis.get("resource_id_"+id)) + 1 +"");
//            jedis.expire("resource_id_"+id, 3600);
//        } else {
//            jedis.lpush("resource_id", id+"");
//            jedis.set("resource_id_"+id, 1+"");
//            // 两个小时后失效
//            jedis.expire("resource_id", 3600);
//            jedis.expire("resource_id_"+id, 3600);
//        }
//    }
//
//    public static String getBodyString(BufferedReader br) {
//        String inputLine;
//        String str = "";
//        try {
//            while ((inputLine = br.readLine()) != null) {
//                str += inputLine;
//            }
//            br.close();
//        } catch (IOException e) {
//            System.out.println("IOException: " + e);
//        }
//        return str;
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//
//}
