package org.website.blog.interfaces.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.website.blog.application.service.ArticleTagService;
import org.website.blog.domain.entity.Tag;
import org.website.blog.interfaces.dto.ArticleDTO;
import org.website.blog.interfaces.dto.TagDTO;

import java.util.List;

@RestController
@RequestMapping(value="/v1/blog")
public class ArticleTagController {

    @Autowired
    private ArticleTagService articleTagService;

    //return all article by page, filter deleted article
    @GetMapping("/articles")
    public ResponseEntity<Page<ArticleDTO>> getArticles(Pageable page){
        return ResponseEntity.ok(articleTagService.getArticles(page));
    }

    //return all tag, filter deleted tags
    @GetMapping("/tags")
    public ResponseEntity<List<TagDTO>> getTags(){
        return ResponseEntity.ok(articleTagService.getTags());
    }

    //select articles by tag id
    @GetMapping("/article/{tagId}")
    public ResponseEntity<Page<ArticleDTO>> getArticlesByTagId(@PathVariable Integer tagId, Pageable page){
        return ResponseEntity.ok(articleTagService.getArticlesByTagId(tagId,page));
    }

    //select tags by article id
    @GetMapping("/tag/{articleId}")
    public ResponseEntity<List<TagDTO>> getTagsByArticleId(@PathVariable Integer articleId){
        return ResponseEntity.ok(articleTagService.getTagsByArticleId(articleId));
    }
    //create article
    @PostMapping("/article")
    public ResponseEntity<ArticleDTO> createArticle(@RequestBody ArticleDTO articleDTO){
        articleTagService.createArticle(articleDTO);
        return ResponseEntity.noContent().build();
    }
    //create tag
    @PostMapping("/tag")
    public ResponseEntity<TagDTO> createTag(@RequestBody TagDTO tagDTO){
        articleTagService.createTag(tagDTO);
        return ResponseEntity.noContent().build();
    }
    //delete articles
    @DeleteMapping("/article/{articleId}")
    public void deleteArticleById(@PathVariable Integer articleId){
        articleTagService.deleteArticleById(articleId);

    }
    //delete tags, cannot delete tag if there are any articles
    @DeleteMapping("/tag/{tagId}")
    public void deleteTagById(@PathVariable Integer tagId){
        articleTagService.deleteTagById(tagId);
    }
    //update article by id
    @PutMapping("/article/{articleId}")
    public ResponseEntity<ArticleDTO> updateArticleById(@RequestBody ArticleDTO articleDTO, @PathVariable Integer articleId){
        articleTagService.updateArticleById(articleDTO);
        return ResponseEntity.noContent()
                .build();
    }
    //update tag by id
    @PutMapping("/tag/{tagId}")
    public ResponseEntity<TagDTO> updateTagById(@RequestBody TagDTO tagDTO, @PathVariable Integer tagId){
        articleTagService.updateTagById(tagDTO);
        return ResponseEntity.noContent()
                .build();
    }
}
