package com.qhit.baseRole.controller;

import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseRole.service.IBaseRoleService;
import com.qhit.baseRoleFunction.service.IBaseRoleFunctionService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/11/29 0029.
 */
@Controller
@RequestMapping("/baseRole")
public class BaseRoleController {
    @Resource
    IBaseRoleService baseRoleService;

    @RequestMapping("/list")
    public String list(Model model) {
        List list = baseRoleService.findAll();
        model.addAttribute("list", list);
        return "baseRole/list";
    }
    /*
    新页面
     */

    @RequestMapping("/assignRight")
    public String getAllRole(Model model) {
        List<BaseRole> list = baseRoleService.findAll();
        model.addAttribute("roleList", list);
        return "baseFunction/RoleModuleRelationShip";
    }

    /*
    增加权限
     */
    @RequestMapping("/addRoleModuleRelation")
    public String addRoleModuleRelation(@RequestParam("rid") Integer roleId ,String fid, HttpServletRequest request) {
//        String[] fids = request.getParameterValues("fid");
            baseRoleService.addRolFunctionRelation(roleId,fid);
        return "redirect:assignRight.action";
    }

    @RequestMapping("/distributeLoad")
    public String distributeLoad(BaseRole baseRole, Model model) {
        List<BaseFunction> leftList = baseRoleService.distributeLeft(baseRole);
        List<BaseFunction> rightList = baseRoleService.distributeRight(baseRole);
        model.addAttribute("leftList", leftList);
        model.addAttribute("rightList", rightList);
        model.addAttribute("rid", baseRole.getRid());
        return "baseRole/distribute";
    }

    @RequestMapping("distributeUpdate")
    public String distributeUpdate(BaseRole baseRole, HttpServletRequest request) {
        String[] fid = request.getParameterValues("fid");
        baseRoleService.distributeUpdate(baseRole.getRid(), fid);
        return "forward:list.action";
    }

}
