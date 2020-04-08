package com.qhit.baseFunction.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseFunction.service.IBaseFunctionService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/11/28.
 */
@Controller
@RequestMapping("/baseFunction")
public class BaseFunctionController {
    @Resource
    IBaseFunctionService iBaseFunctionService;

    /**
     * 查询所有分类信息
     *
     * @return
     */
    @RequestMapping("/ajaxList")
//    @ResponseBody
    public void ajaxList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //没有权限
        List<BaseFunction> list = iBaseFunctionService.findAll();
        response.getWriter().write(String.valueOf(JSONArray.toJSON(list)));

    }

    @RequestMapping("/ajaxfunctionList")
    public void ajaxfunctionList(@RequestParam("uid") Integer uid, HttpServletResponse response) throws IOException {
        //加上权限
        List<BaseFunction> list = iBaseFunctionService.findFunctionByuid(uid);
        response.getWriter().write(String.valueOf(JSONArray.toJSON(list)));
    }

    @RequestMapping("/list")
    public String list(Model model) {
        List<BaseFunction> list = iBaseFunctionService.findAll();
        model.addAttribute("list", list);
        return "baseFunction/list";
    }

    @RequestMapping("/listold")
    public String listold(Model model) {
        List<BaseFunction> list = iBaseFunctionService.findAll();
        model.addAttribute("list", list);
        return "baseFunction/listold";
    }

    //查看模块名称
    @RequestMapping("/moduleList")
    public void moduleList(HttpServletResponse response) throws IOException {
        List<BaseFunction> list = iBaseFunctionService.findmodule();
        String s = JSON.toJSONString(list);
        response.getWriter().write(s);
    }

    @RequestMapping("/insert")
    public String insert(BaseFunction baseFunction) {
        iBaseFunctionService.insert(baseFunction);
        return "forward:list.action";
    }

    @RequestMapping("/delete")
    public String delete(BaseFunction baseFunction) {
        iBaseFunctionService.delete(baseFunction.getFid());
        return "forward:list.action";
    }

    //编辑
    @RequestMapping("/load")
    public String load(BaseFunction baseFunction, Model model) {
        baseFunction = iBaseFunctionService.findById(baseFunction.getFid());
        model.addAttribute("baseFunction", baseFunction);
        return "baseFunction/edit";
    }

    /*
    新编辑
     */
    @RequestMapping("/ajaxload")
//    @ResponseBody
    public void ajaxGetModule(@RequestParam("fid") Integer fid, Model model, HttpServletResponse response) throws Exception {
        BaseFunction baseFunction = iBaseFunctionService.findById(fid);
        String s = JSONObject.toJSONString(baseFunction);
        response.getWriter().write(s);

    }

    @RequestMapping("/update")
    public String update(BaseFunction baseFunction) {
        iBaseFunctionService.update(baseFunction);
        return "forward:list.action";
    }

    //查询
    @RequestMapping("/search")
    public String search(BaseFunction baseFunction, Model model) {
        List<BaseFunction> list = iBaseFunctionService.search(baseFunction);
        model.addAttribute("list", list);
        model.addAttribute("searchObject", baseFunction);
        return "baseFunction/listold";
    }


}
