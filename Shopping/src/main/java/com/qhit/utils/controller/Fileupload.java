package com.qhit.utils.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/upload")
public class Fileupload {

    @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
    @ResponseBody
    public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String path = request.getServletContext().getRealPath("/images/upload");//文件的上传路径
//        String path4 = request.getSession().getServletContext().getRealPath("/images");
        System.out.println("path" + path);
//        System.out.println("path4" + path4);获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("文件名" + fileName);
        String path1[] = path.split("\\\\");//对于特殊字符的分隔|  ^   $  *   .    (    )   \   /等都是正则表达式的一部分，只能通过前面加上\\进行转义。注意\要用三个\\\，也就是split（“\\\\”）
        String path2 = path1[path1.length - 1];//截取图片所在的文件夹名称
        File dir = new File(path, fileName);//将指定文件上传到指定的目录下
        /**
         * 如果文件夹不存在，自动创建该文件夹
         */
        if (!dir.exists()) {
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        if (!file.isEmpty()) {
            file.transferTo(dir);
            return path2 + '\\' + fileName;
        } else {
            System.out.println("空文件");
            return "不允许上传空文件";
        }

    }

}
