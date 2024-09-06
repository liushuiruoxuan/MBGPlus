<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">
    <!-- 开启二级缓存 -->
    <#--    <cache type="${cacheClassName}"/>-->
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${package.Entity}.${entity}">
        <#list table.fields as field>
            <#if field.keyFlag><#--生成主键排在第一位-->
                <id column="${field.name}" property="${field.propertyName}"  javaType="${field.propertyType}"/>
            </#if>
        </#list>
        <#list table.commonFields as field><#--生成公共字段 -->
            <result column="${field.name}" property="${field.propertyName}"   javaType="${field.propertyType}"/>
        </#list>
        <#list table.fields as field>
            <#if !field.keyFlag><#--生成普通字段 -->
                <result column="${field.name}" property="${field.propertyName}" javaType="${field.propertyType}"/>
            </#if>
        </#list>
    </resultMap>

    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
        <#list table.commonFields as field>
            ${field.columnName},
        </#list>
        ${table.fieldNames}
    </sql>
    <select id="get${entity}List" parameterType="${package.Entity}.${entity}" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table.name}
        <where>
            <#list table.fields as field>
                <if test="${field.propertyName} != null and ${field.propertyName} != ''">
                   and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                </if>
            </#list>
        </where>
    </select>
</mapper>
