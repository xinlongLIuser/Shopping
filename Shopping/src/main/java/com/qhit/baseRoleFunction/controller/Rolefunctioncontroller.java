package com.qhit.baseRoleFunction.controller;

import com.qhit.baseRoleFunction.service.IBaseRoleFunctionService;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/baseRoleFunction")
public class Rolefunctioncontroller {
    @Autowired
    IBaseRoleFunctionService baseRoleFunctionService;

    @RequestMapping(value = "/ajaxGetModuleIdsByRoleId")
    @ResponseBody
    public String ajaxGetModuleIdsByRoleId(Integer rid, HttpServletResponse response) throws Exception {
       List<Integer> list = baseRoleFunctionService.findModuleIdsByRoleId(rid);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();

    }

}
