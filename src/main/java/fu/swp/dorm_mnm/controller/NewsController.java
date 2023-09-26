package fu.swp.dorm_mnm.controller;

import fu.swp.dorm_mnm.model.News;
import fu.swp.dorm_mnm.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/api/v1/admin/news")
public class NewsController {
    @Autowired
    NewsService newsService;
    @GetMapping
    public  ResponseEntity<Map<String,Object>> getNewsPage(@RequestParam(required = false) String title,
            @RequestParam(value = "page",defaultValue = "0") int pageNo){
        try {
            Page<News> page;
            if (title == null) {
                page=newsService.findAll(pageNo);
            }
            else{
                page=newsService.findAllByTitle(title,pageNo);
            }
            Map<String, Object> response = new HashMap<>();
            response.put("content", page.getContent());
            response.put("currentPage", page.getNumber());
            response.put("totalItems", page.getTotalElements());
            response.put("totalPages", page.getTotalPages());
            return new ResponseEntity<>(response,HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
