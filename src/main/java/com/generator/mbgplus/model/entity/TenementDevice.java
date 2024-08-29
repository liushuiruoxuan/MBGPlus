package com.generator.mbgplus.model.entity;

import lombok.Data;

        import java.time.LocalDateTime;

/**
* 3号楼空调设备
*
* @author chai
* @since 2024-08-29
*/
@Data
public class TenementDevice {

    /**
    * 自增主键
    */
    private Integer id;
    /**
    * 楼宇
    */
    private Integer tenement;
    /**
    * 所属楼层
    */
    private String floor;
    /**
    * 区域
    */
    private String region;
    /**
    * 设备编号
    */
    private String deviceId;
    /**
    * 设备类型 1温控器WKQ 2风机盘管FJPG
    */
    private Byte deviceType;
    /**
    * 设备位置
    */
    private String deviceAddress;
    /**
    * 发送指令字段
    */
    private String cpnName;
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
    private Byte isDel;
    /**
    * 创建时间
    */
    private LocalDateTime createTime;
    /**
    * 修改时间
    */
    private LocalDateTime updateTime;
}
