package com.generator.mbgplus.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

        import java.time.LocalDateTime;

/**
* 3号楼空调设备
*
* @author chai
* @since 2024-08-12 14:55:07
*/
@Data
@TableName("t_tenement_device")
public class TenementDevice {

    /**
    * 自增主键
    */
            @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
    * 和bacnet_device 表关联
    */
    private Integer deviceIdRel;
    /**
    * 楼宇
    */
    private Integer tenement;
    /**
    * 所属楼层
    */
    private Integer floor;
    /**
    * 区域
    */
    private String region;
    /**
    * 设备编号
    */
    private String deviceId;
    /**
    * 设备类型 1空调 other 
    */
    private Integer deviceType;
    /**
    * 系统内编号
    */
    private String systemId;
    /**
    * 设备位置
    */
    private String deviceAddress;
    /**
    * 面板实际位置
    */
    private String panelAddress;
    /**
    * 备注
    */
    private String remark;
    /**
    * 坐标
    */
    private String devicePositions;
    /**
    * x
    */
    private Integer x;
    /**
    * y
    */
    private Integer y;
    /**
    * 有效标识，1：有效；0：无效
    */
    private Integer isDel;
    /**
    * 创建时间
    */
    private LocalDateTime createTime;
    /**
    * 修改时间
    */
    private LocalDateTime updateTime;
}
