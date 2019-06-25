package com.ddc.server.controller;


import com.ddc.server.config.web.http.ResponseHelper;
import com.ddc.server.config.web.http.ResponseModel;
import com.ddc.server.entity.DDCRole;
import com.ddc.server.entity.DDCRoleAuth;
import com.ddc.server.service.IDDCRoleAuthService;
import com.ddc.server.service.IDDCRoleService;
import com.ddc.server.service.SpringContextBeanService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MuQ
 * @since 2019-06-19
 */
@RestController
@RequestMapping("/role")
@Slf4j
public class RoleController {
    @Resource
    private IDDCRoleService roleService;
    @Resource
    private IDDCRoleAuthService roleAuthService;

    @RequestMapping("/list")
    @ResponseBody
    public ResponseModel<List<DDCRole>> RoleList(HttpServletResponse resp){
        roleService = SpringContextBeanService.getBean(IDDCRoleService.class);
        List<DDCRole> list = roleService.selectAllRole();
        for(int i = 0; i < list.size()-1; i++){
            for(int j = i + 1; j < list.size(); j++){
                if(list.get(i).getId().equals(list.get(j).getId())){
                    list.get(i).setAdminName(list.get(i).getAdminName() + "," + list.get(j).getAdminName());
                    list.remove(j);
                    j--;
                }
            }
        }
        return ResponseHelper.buildResponseModel(list);
    }

    @RequestMapping("/addRole")
    @ResponseBody
    public ResponseModel<String> insertAdd(HttpServletRequest request, @RequestParam(value = "name",required = false) String name, @RequestParam(value = "remark",required = false) String remark, @RequestParam(value="authIdItems") String authIdItems, HttpSession session , Model model) throws Exception {
        String msg;
        DDCRole role = new DDCRole(name,remark);
        roleService = SpringContextBeanService.getBean(IDDCRoleService.class);
        roleService.insertRole(role);
        Long roleId = roleService.selectRoleId(name).getId();
        roleAuthService.insertRoleAuth(roleId,authIdItems);
        DDCRoleAuth roleAuth;
        String[] strs = authIdItems.split(",");
        for (int i = 0; i < strs.length; i++) {
            long authId = Long.parseLong(strs[i]);
            roleAuth = new DDCRoleAuth(roleId,authId);

        }
        msg = "添加成功";
        return ResponseHelper.buildResponseModel(msg);
    }


    @RequestMapping("/delRole")
    @ResponseBody
    public ResponseModel<String> delAdmin(HttpServletRequest request, @RequestParam(value = "id",required = false) Long id) throws Exception {
        String msg;
        if (id != null) {
            roleService = SpringContextBeanService.getBean(IDDCRoleService.class);
            roleService.delRole(id);
            msg = "删除成功";
        }else{
            msg = "数据出错";
        }
        return ResponseHelper.buildResponseModel(msg);
    }


    @RequestMapping("/batchDel")
    @ResponseBody
    public void batchDeletes(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="delItems") String delItems) {
        String[] strs = delItems.split(",");
        for (int i = 0; i < strs.length; i++) {
            long oid = Long.parseLong(strs[i]);
            roleService.delRole(oid);
        }
    }



    @RequestMapping("/admin-role-modify")
    @ResponseBody
    public ModelAndView findRole(@RequestParam(value="id") Long id, HttpSession session){
        DDCRole role = roleService.selectByRoleId(id);
        session.setAttribute("role",role);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin-role-modify");
        return modelAndView;
    }


    @RequestMapping("/modifyRole")
    @ResponseBody
    public void modifyRole(HttpServletRequest request, @RequestParam(value = "id",required = false) Long id, @RequestParam(value = "name",required = false) String name, @RequestParam(value = "remark",required = false) String remark, @RequestParam(value="authIdItems") String authIdItems, HttpSession session , Model model){
        DDCRole role = new DDCRole(id,name,remark);
        roleService.updateRole(role);
        roleAuthService.delRoleAuthByRoleId(id);
        roleAuthService.insertRoleAuth(id,authIdItems);
    }



}

