package org.website.blog.application.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.website.blog.interfaces.dto.ArticleDTO;
import org.website.blog.interfaces.dto.TagDTO;

import java.util.List;

public interface ArticleTagService {
    //return all article by page, filter deleted article
    Page<ArticleDTO> getArticles(Pageable page);
    //return all tag, filter deleted tags
    List<TagDTO> getTags();
    //select articles by tag id
    Page<ArticleDTO> getArticlesByTagId(Integer tagId, Pageable page);
    //select tags by article id
    List<TagDTO> getTagsByArticleId(Integer articleId);
    //create article
    void createArticle(ArticleDTO articleDTO);
    //create tag
    void createTag(TagDTO tagDTO);
    //delete articles
    void deleteArticleById(Integer articleId);
    //delete tags, cannot delete tag if there are any articles
    void deleteTagById(Integer tagId);
    //update article by id
    void updateArticleById(ArticleDTO articleDTO);
    //update tag by id
    void updateTagById(TagDTO tagDTO);
}
