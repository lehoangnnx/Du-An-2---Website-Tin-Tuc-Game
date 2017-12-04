/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp PagesServiceImpl kế thừ Interface PagesService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.Pages;
import com.javaweb.repository.PagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("pagesService")
public class PagesServiceImpl implements PagesService {
    @Autowired
    PagesRepository pagesRepository;
    
    @Override
    public List<Pages> findAll() {
        return pagesRepository.findAll();
    }
}
