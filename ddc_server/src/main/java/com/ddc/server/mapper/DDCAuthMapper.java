package com.ddc.server.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ddc.server.entity.DDCAuth;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Mapper 接口
 *
 * @author dingpengfei
 * @since 2019-05-09
 */

public interface DDCAuthMapper extends BaseMapper<DDCAuth> {
    List<DDCAuth> getAuthList();

    void delById(@Param(value = "id") long id);

}
