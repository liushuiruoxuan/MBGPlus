<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">
    <!-- 开启二级缓存 -->
    <#--    <cache type="${cacheClassName}"/>-->
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${package.Entity}.${entity}">
        <#list table.fields as field>
            <#if field.keyFlag><#--生成主键排在第一位-->
                <id column="${field.name}" property="${field.propertyName}" javaType="${field.propertyType}"/>
            </#if>
        </#list>
        <#list table.commonFields as field><#--生成公共字段 -->
            <result column="${field.name}" property="${field.propertyName}" javaType="${field.propertyType}"/>
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

    <select id="get${entity}One" parameterType="${package.Entity}.${entity}" resultMap="BaseResultMap">
        select
        from ${table.name}
        <where>
            <#list table.fields as field>
                <if test="${field.propertyName} != null and ${field.propertyName} != ''">
                    and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                </if>
            </#list>
        </where>
        limit 1
    </select>

    <insert id="insert${entity}" parameterType="${package.Entity}.${entity}">
        insert into ${table.name}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list table.fields as field>
                ${field.name},
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list table.fields as field>
                ${r"#{"}${field.propertyName}${r"}"},
            </#list>
        </trim>
    </insert>

    <insert id="insertBatch${entity}">
        insert into ${table.name}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list table.fields as field>
                ${field.name},
            </#list>
        </trim>
        values
        <foreach collection="list" item="item" index="index" separator=",">
            <trim prefix="(" suffix=")" suffixOverrides=",">
                <#list table.fields as field>
                    ${r"#{"}$item.${field.propertyName}${r"}"},
                </#list>
            </trim>
        </foreach>
    </insert>

    <update id="update${entity}" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                <if test="${field.propertyName} != null and ${field.propertyName} != ''">
                    ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
                </if>
            </#list>
        </set>
        <where>
            <#list table.fields as field>
                    <if test="${field.propertyName} != null">
                        and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                    </if>
            </#list>
        </where>
    </update>

    <update id="updateBatch${entity}Ids" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
            </#list>
        </set>
        where
        <#list table.fields as field>
            <#if field.keyFlag>
                ${field.name} in
                <foreach collection="${field.name}s" item="item" index="index" open="(" close=")" separator=",">
                    ${r"#{"}item.${field.propertyName}${r"}"}
                </foreach>
            </#if>
        </#list>
    </update>

    <update id="updateBatch${entity}">
        <foreach collection="list" item="item" index="index" open="(" close=")" separator=";">
            update ${table.name}
            <set>
                <#list table.fields as field>
                    ${field.name} = ${r"#{"}item.${field.propertyName}${r"}"},
                </#list>
            </set>
            where
            <#list table.fields as field>
                <#if field.keyFlag>
                    ${field.name} = ${r"#{"}item.${field.propertyName}${r"}"}
                </#if>
            </#list>
        </foreach>
    </update>

    <update id="delete${entity}" parameterType="${package.Entity}.${entity}">
        <!-- 逻辑删除 -->
        update ${table.name}
        <set>
            <#list table.fields as field>
                ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
            </#list>
        </set>
        <where>
            <#list table.fields as field>
                <#if field.keyFlag>
                    and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                </#if>
            </#list>
        </where>
    </update>

    <update id="deleteBatch${entity}" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
            </#list>
        </set>
        where
        <#list table.fields as field>
            <#if field.keyFlag>
                ${field.name} in
                <foreach collection="${field.name}s" item="item" index="index" open="(" close=")" separator=",">
                    ${r"#{"}item.${field.propertyName}${r"}"}
                </foreach>
            </#if>
        </#list>
    </update>
</mapper>
