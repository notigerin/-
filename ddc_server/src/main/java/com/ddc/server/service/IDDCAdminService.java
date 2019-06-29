package com.ddc.server.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.ddc.server.entity.DDCAdmin;

import java.util.List;
import java.util.Map;

/**
 *  服务类
 *
 * @author MuQ
 * @since 2019-06-19
 */
public interface IDDCAdminService extends IService<DDCAdmin> {


    DDCAdmin selectByName(String name);

    List<DDCAdmin> selectAllAdmin();

    void insertAdmin(DDCAdmin admin);

    void delAdmin(long id);

    void updateAdmin(DDCAdmin admin);
    Map<String, Object> checkNameAndPasswd(JSONObject requestJson);

    void updateStatus(long id, Integer status);

    List<DDCAdmin> selectByRoleId(Long roleId);

    Page<DDCAdmin> selectAdminPage(Map<String, Object> map);


}

