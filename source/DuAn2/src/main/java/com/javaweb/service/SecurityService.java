/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface SecurityService thưc thi xử lý
* */
package com.javaweb.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
