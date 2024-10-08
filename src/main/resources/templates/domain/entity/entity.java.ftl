package ${package.Entity};

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* <p>
    * ${table.comment!}
    * </p>
*
* @author ${author}
* @since ${date}
*/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "${entity}对象", description = "${table.comment!}")
public class ${entity} implements Serializable {

<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>

    @ApiModelProperty("${field.comment}")
    private ${field.propertyType} ${field.propertyName};
</#list>
}
