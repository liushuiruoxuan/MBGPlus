package ${package.Mapper};

import ${package.Entity}.${entity};

/**
* <p>
    * ${table.comment!} Mapper 接口
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if mapperAnnotationClass??>
    @${mapperAnnotationClass.simpleName}
</#if>

public interface ${table.mapperName}  {

}

