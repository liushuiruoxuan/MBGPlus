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

    <sql id="list_where">
        <where>
            <#list table.fields as field>
                <#if field.propertyName?contains("delFlag")>
                    del_flag = 0
                <#elseif field.propertyType == "String">
                    <if test="${field.propertyName} != null and ${field.propertyName} !=''">
                        and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                    </if>

                <#else>
                    <if test="${field.propertyName} != null">
                        and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                    </if>
                </#if>
            </#list>
        </where>
    </sql>
    <sql id="update_where">
        <where>
            <#list table.fields as field>
                <#if field.keyFlag>
                    <if test="${field.propertyName} != null">
                        and ${field.name} = ${r"#{"}${field.propertyName}${r"}"}
                    </if>
                </#if>
            </#list>
        </where>
    </sql>
    <select id="get${entity}List" parameterType="${package.Entity}.${entity}" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table.name}
        <include refid="list_where"/>
    </select>

    <select id="get${entity}One" parameterType="${package.Entity}.${entity}" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${table.name}
        <include refid="list_where"/>
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
                    ${r"#{"}item.${field.propertyName}${r"}"},
                </#list>
            </trim>
        </foreach>
    </insert>

    <update id="update${entity}" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                <#if !field.keyFlag>
                    <if test="${field.propertyName} != null">
                        ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
                    </if>
                </#if>
            </#list>
        </set>
        <include refid="update_where"/>
    </update>

    <update id="updateBatch${entity}Ids" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                <#if !field.keyFlag>
                    ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
                </#if>
            </#list>
        </set>
        <where>
            <#list table.fields as field>
                <#if field.keyFlag>
                    ${field.name} in
                    <foreach collection="${field.name}s" item="item" index="index" open="(" close=")" separator=",">
                        ${r"#{"}item.${field.propertyName}${r"}"}
                    </foreach>
                </#if>
            </#list>
        </where>
    </update>

    <update id="updateBatch${entity}">
        update ${table.name}
        <trim prefix="set" suffixOverrides=",">
            <foreach collection="list" item="item" index="index" open="(" close=")" separator=";">
                <#list table.fields as field>
                    <trim prefix="${field.name}=case" suffix="end,">
                        <foreach collection="list" item="item" index="index">
                            <#if  field.propertyType == "String">
                                <if test="${r"#{"}item.${field.propertyName}${r"}"} !=null and ${r"#{"}item.${field.propertyName}${r"}"} != ''">
                                    when id= ${r"#{"}item.id${r"}"} then ${r"#{"}item.${field.propertyName}${r"}"}
                                </if>
                            <#else>
                                <if test="${r"#{"}item.${field.propertyName}${r"}"} !=null">
                                    when id= ${r"#{"}item.id${r"}"} then ${r"#{"}item.${field.propertyName}${r"}"}
                                </if>
                            </#if>
                        </foreach>
                    </trim>
                </#list>
            </foreach>
        </trim>
        <where>
            id in
            <foreach collection="list" item="item" index="index" open="(" close=")" separator=",">
                ${r"#{"}item.id${r"}"}
            </foreach>
        </where>
    </update>

    <update id="delete${entity}" parameterType="${package.Entity}.${entity}">
        <!-- 逻辑删除 -->
        update ${table.name}
        <set>
            <#list table.fields as field>
                <#if !field.keyFlag>
                    ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
                </#if>
            </#list>
        </set>
        <include refid="update_where"/>
    </update>

    <update id="deleteBatch${entity}" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <set>
            <#list table.fields as field>
                <#if !field.keyFlag>
                    ${field.name} = ${r"#{"}${field.propertyName}${r"}"},
                </#if>
            </#list>
        </set>
        <where>
            <#list table.fields as field>
                <#if field.keyFlag>
                    ${field.name} in
                    <foreach collection="${field.name}s" item="item" index="index" open="(" close=")" separator=",">
                        ${r"#{"}item.${field.propertyName}${r"}"}
                    </foreach>
                </#if>
            </#list>
        </where>
    </update>
</mapper>
