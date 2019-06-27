package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.*;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 管理员表
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
@TableName("ddc_admin")
public class DDCAdmin extends Model<DDCAdmin> {

    private static final long serialVersionUID = 1L;
    /**
     * 用户主键
     */
    @TableId("id")
    private Long id;
    /**
     * 用户名
     */
    private String name;

    /**
     * 密码
     */
    private String password;
    /**
     * 盐 值 用户名+时间戳
     */
    private String salt;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 密码
     */
    private String mobile;
    /**
     * 手机号
     */
    private String email;
    /**
     * 角色ID
     */
    @TableField(value = "role_id")
    private Long roleId;
    /**
     * 备注
     */
    @TableField("remark")
    private String remark;
    /**
     * 创建人
     */
    @TableField("create_by")
    private Long createBy;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private String createTime;
    /**
     * 更新人
     */
    @TableField("update_by")
    private Long updateBy;
    /**
     * 更新时间
     */
    @TableField("update_time")
    private String updateTime;


    /**
     * 状态值（1：启用，2：禁用）
     */
    private Integer status;
    /**
     * 删除标志
     */
    @TableField("del_flag")
    private Integer delFlag;

    @TableField(exist = false)
    private String token;

    @TableField(exist = false)
    private String roleName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCAdmin(String name) {
        this.name = name;
    }

    public DDCAdmin(String name, String password, Integer sex, String mobile, String email, Long roleId, String remark) {
        SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.id = 0L;
        this.name = name;
        this.password = password;
        this.sex = sex;
        this.mobile = mobile;
        this.email = email;
        this.roleId = roleId;
        this.remark = remark;
        this.createTime= data.format(new Date(System.currentTimeMillis()));
        this.updateTime= data.format(new Date(System.currentTimeMillis()));
        this.createBy=0L;
        this.updateBy=0L;
        this.delFlag=0;
        this.status=0;
    }

    public DDCAdmin(long id, String name, Integer sex, String mobile, String email, Long roleId, String remark) {
        SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.mobile = mobile;
        this.email = email;
        this.roleId = roleId;
        this.remark = remark;
        this.updateTime = data.format(new Date(System.currentTimeMillis()));
    }
    public DDCAdmin(long id, String name, String password, Integer sex, String mobile, String email, Long roleId, String remark) {
        SimpleDateFormat data = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.id = id;
        this.name = name;
        this.password = password;
        this.sex = sex;
        this.mobile = mobile;
        this.email = email;
        this.roleId = roleId;
        this.remark = remark;
        this.updateTime = data.format(new Date(System.currentTimeMillis()));
    }
}
