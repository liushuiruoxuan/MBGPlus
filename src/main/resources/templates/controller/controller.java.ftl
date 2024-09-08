package ${package.Controller};

import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
* ${table.comment!} 前端控制器
* @author ${author}
* @since ${date}
*/
@RestController
@RequestMapping("${table.entityPath}")
public class ${table.controllerName} {

    @Resource
    private ${table.serviceName} ${table.serviceName};

    @PostMapping("/get${entity}List")
    public ResponseResult<List<${entity}>> get${entity}List(@RequestBody ${entity} request) {
        return ResponseResult.success(${table.serviceName}.get${entity}List(request));
    }
    @PostMapping("/get${entity}Page")
    public ResponseResult<PageResponse<${entity}>> get${entity}Page(@RequestBody PageRequest<${entity}> request) {
        return ResponseResult.success(I${entity}Service.get${entity}Page(request));
    }

    @PostMapping("/get${entity}One")
    public ResponseResult<${entity}> get${entity}One(@RequestBody ${entity} request) {
        return ResponseResult.success(${table.serviceName}.get${entity}One(request));
    }
}
