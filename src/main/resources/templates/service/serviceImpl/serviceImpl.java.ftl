package ${package.ServiceImpl};

import ${package.Service}.${table.serviceName};
import ${package.Mapper}.${table.mapperName};
import ${package.Entity}.${entity};
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;
import java.util.List;
/**
* ${table.comment!} 服务实现类
*
* @author ${author}
* @since ${date}
*/
@Service
public class ${table.serviceImplName} implements ${table.serviceName}{
    @Resource
    private ${table.mapperName} ${table.mapperName?uncap_first};
    @Override
    public List<${entity}> get${entity}List(${entity} request) {
      return ${table.mapperName?uncap_first}.get${entity}List(request);
    }
    @Override
    public PageResponse<${entity}> get${entity}Page(PageRequest<${entity}> request) {
      int pageNum = request.getPageNum();
      int pageSize = request.getPageSize();
      PageHelper.startPage(pageNum, pageSize);
      List<${entity}> ${entity?uncap_first}List = ${table.mapperName?uncap_first}.get${entity}List(request.getParamData());
      PageInfo<${entity}> pageInfo = new PageInfo<>(${entity?uncap_first}List);
      return new PageResponse<>(pageInfo);
    }
    @Override
    public ${entity} get${entity}One(${entity} request) {
      return ${table.mapperName?uncap_first}.get${entity}One(request);
    }


    @Override
    public int insert${entity}(${entity} request) {
        return ${table.mapperName?uncap_first}.insert${entity}(request);
    }

    @Override
    public int insertBatch${entity}(List<${entity}> request) {
      return ${table.mapperName?uncap_first}.insertBatch${entity}(request);
    }

    @Override
    public int update${entity}(${entity} request) {
      return ${table.mapperName?uncap_first}.update${entity}(request);
    }

    @Override
    public int updateBatch${entity}Ids(${entity} request) {
      return ${table.mapperName?uncap_first}.updateBatch${entity}Ids(request);
    }

    @Override
    public int updateBatch${entity}(List<${entity}> request) {
      return ${table.mapperName?uncap_first}.updateBatch${entity}(request);
    }

    @Override
    public int delete${entity}(${entity} request) {
      return ${table.mapperName?uncap_first}.delete${entity}(request);
    }

    @Override
    public int deleteBatch${entity}(${entity} request) {
      return ${table.mapperName?uncap_first}.deleteBatch${entity}(request);
    }
}