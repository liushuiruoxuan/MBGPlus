package com.generator.mbgplus.one.model.entity;

    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.annotation.TableId;
    import com.baomidou.mybatisplus.annotation.TableName;
    import java.io.Serializable;
    import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
* <p>
    * 3号楼空调设备
    * </p>
*
* @author chai
* @since 2024-09-04
*/
@Data
@ApiModel(value = "TenementDevice对象", description = "3号楼空调设备")
public class TenementDevice implements Serializable {


    @ApiModelProperty("自增主键")
    private Integer id;

    @ApiModelProperty("楼宇")
    private Integer tenement;

    @ApiModelProperty("所属楼层")
    private String floor;

    @ApiModelProperty("区域")
    private String region;

    @ApiModelProperty("设备编号")
    private String deviceId;

    @ApiModelProperty("设备类型 1温控器WKQ 2风机盘管FJPG")
    private Byte deviceType;

    @ApiModelProperty("设备位置")
    private String deviceAddress;

    @ApiModelProperty("发送指令字段")
    private String cpnName;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("坐标")
    private String devicePositions;

    @ApiModelProperty("x")
    private Integer x;

    @ApiModelProperty("y")
    private Integer y;

    @ApiModelProperty("有效标识，1：有效；0：无效")
    private Byte isDel;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("修改时间")
    private LocalDateTime updateTime;
}
