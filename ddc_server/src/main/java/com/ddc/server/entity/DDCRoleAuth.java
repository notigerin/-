package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.*;

import java.io.Serializable;

/**
 * 角色权限中间表
 *
 * @author MuQ
 * @since 2019-06-19
 */
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@TableName("dcc_role_auth")
public class DDCRoleAuth extends Model<DDCRoleAuth> {

    private static final long serialVersionUID = 1L;
    /**
     * 用户主键
     */
    @TableId("id")
    private Long id;
    /**
     * 用户名
     */
    @TableField("role_id")
    private Long roleId;
    @TableField("auth_id")
    private Long authId;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCRoleAuth(Long roleId, Long authId){
        this.id=0L;
        this.roleId=roleId;
        this.authId=authId;
    }

}
