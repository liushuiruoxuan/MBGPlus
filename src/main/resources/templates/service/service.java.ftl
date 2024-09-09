package ${package.Service};
import ${package.Entity}.${entity};
import java.util.List;


/**
*
* ${table.comment!} 服务类
* @author ${author}
* @since ${date}
*/
public interface ${table.serviceName}  {
    /**
    * 根据条件查询列表
    * @param request
    * @return
    */
    List<${entity}> get${entity}List(${entity} request);

    /**
    * 分页查询列表
    * @param request
    * @return
    */
    PageResponse<${entity}> get${entity}Page(PageRequest<${entity}> request);
    /**
    * 查询一条数据（查详情）
    * @param request
    * @return
    */
    ${entity} get${entity}One(${entity} request);
    /**
    * 新增
    * @param request
    * @return
    */
    int insert${entity}(${entity} request);
    /**
    * 批量新增
    * @param request
    * @return
    */
    int insertBatch${entity}(List<${entity}> request);
    /**
    * 修改
    * @param request
    * @return
    */
    int update${entity}(${entity} request);
    /**
    * 通过Ids批量修改
    * @param request
    * @return
    */
    int updateBatch${entity}Ids(${entity} request);
    /**
    * 批量修改
    * @param request
    * @return
    */
    int updateBatch${entity}(List<${entity}> request);
    /**
    * 逻辑删除
    * @param request
    * @return
    */
    int delete${entity}(${entity} request);
    /**
    * 批量逻辑删除
    * @param request
    * @return
    */
    int deleteBatch${entity}(${entity} request);
}
