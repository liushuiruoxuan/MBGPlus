package ${package.Service};
import ${package.Entity}.${entity};
import java.util.List;
import com.github.pagehelper.Page;


/**
*
* ${table.comment!} 服务类
* @author ${author}
* @since ${date}
*/
public interface ${table.serviceName}  {
  List<${entity}> get${entity}List(${entity} request);
  PageResponse<${entity}> get${entity}Page(PageRequest<${entity}> request);
  ${entity} get${entity}One(${entity} request);
}
