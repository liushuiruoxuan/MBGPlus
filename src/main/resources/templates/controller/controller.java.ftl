package ${package.Controller};

import ${package.Controller}.request.${entity}Request;
import ${package.Controller}.response.${entity}Response;
import ${package.Service}.${table.serviceName};
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
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
    public ResponseResult<List<${entity}Response>> get${entity}List(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.get${entity}List(request));
    }
    @PostMapping("/get${entity}Page")
    public ResponseResult<PageResponse<${entity}Response>> get${entity}Page(@RequestBody PageRequest<${entity}Request> request) {
        return ResponseResult.success(I${entity}Service.get${entity}Page(request));
    }

    @PostMapping("/get${entity}One")
    public ResponseResult<${entity}Response> get${entity}One(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.get${entity}One(request));
    }

    @PostMapping("/insert${entity}")
    public ResponseResult<Integer> insert${entity}(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.insert${entity}(request));
    }

    @PostMapping("/insertBatch${entity}")
    public ResponseResult<Integer> insertBatch${entity}(@RequestBody List<${entity}Request> request) {
        return ResponseResult.success(${table.serviceName}.insertBatch${entity}(request));
    }

    @PostMapping("/update${entity}")
    public ResponseResult<Integer> update${entity}(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.update${entity}(request));
    }

    @PostMapping("/updateBatch${entity}Ids")
    public ResponseResult<Integer> updateBatch${entity}Ids(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.updateBatch${entity}Ids(request));
    }

    @PostMapping("/updateBatch${entity}")
    public ResponseResult<Integer> updateBatch${entity}(@RequestBody List<${entity}Request> request) {
        return ResponseResult.success(${table.serviceName}.updateBatch${entity}(request));
    }

    @PostMapping("/delete${entity}")
    public ResponseResult<Integer> delete${entity}(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.delete${entity}(request));
    }

    @PostMapping("/deleteBatch${entity}")
    public ResponseResult<Integer> deleteBatch${entity}(@RequestBody ${entity}Request request) {
        return ResponseResult.success(${table.serviceName}.deleteBatch${entity}(request));
    }

}