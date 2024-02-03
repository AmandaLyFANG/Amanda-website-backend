package org.website.blog.application.service.Impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.website.blog.application.service.ArticleTagService;
import org.website.blog.domain.entity.Article;
import org.website.blog.domain.entity.Tag;
import org.website.blog.domain.repository.ArticleRepository;
import org.website.blog.domain.repository.TagRepository;
import org.website.blog.infra.util.JpaUtil;
import org.website.blog.interfaces.dto.ArticleDTO;
import org.website.blog.interfaces.dto.TagDTO;

import java.util.List;
import java.util.Optional;

@Service
public class ArticleTagServiceImpl implements ArticleTagService {
    @Autowired
    private ArticleRepository articleRepository;
    @Autowired
    private TagRepository tagRepository;
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public Page<ArticleDTO> getArticles(Pageable page) {
        Article article = new Article();
        article.setIsDelete(false);
        Page<Article> articles = articleRepository.findAll(Example.of(article),page);
        Page<ArticleDTO> articleDTOS = articles.map(e -> new ArticleDTO(e));
        return articleDTOS;
    }

    @Override
    public List<TagDTO> getTags() {
        Tag tag = new Tag();
        tag.setIsDelete(false);
        List<Tag> tags = tagRepository.findAll(Example.of(tag));
        List<TagDTO> tagDTOS = tags.stream().map(t -> new TagDTO(t)).toList();
        return tagDTOS;
    }

    @Override
    public Page<ArticleDTO> getArticlesByTagId(Integer tagId, Pageable page) {
        Page<Article> articlesByTagId = articleRepository.findArticlesByTagId(tagId, page);
        Page<ArticleDTO> articleDTOS = articlesByTagId.map(article -> new ArticleDTO(article));
        return articleDTOS;
    }

    @Override
    public List<TagDTO> getTagsByArticleId(Integer articleId) {
        tagRepository.findTagsByArticleId(articleId);
        return null;
    }

    @Override
    public void createArticle(ArticleDTO articleDTO) {
        articleRepository.save(new Article(articleDTO));
    }

    @Override
    public void createTag(TagDTO tagDTO) {
        tagRepository.save(new Tag(tagDTO));
    }

    @Override
    public void deleteArticleById(Integer articleId) {
        Article article = articleRepository.findById(articleId).get();
        article.setIsDelete(true);
        articleRepository.save(article);
    }

    @Override
    public void deleteTagById(Integer tagId) {
        Tag tag = tagRepository.findById(tagId).get();
        tag.setIsDelete(true);
        tagRepository.save(tag);
    }


    @Override
    public void updateArticleById(ArticleDTO articleDTO) {
        if(null != articleDTO.getArticleId()){
            Article article = articleRepository.findById(articleDTO.getArticleId()).get();
            JpaUtil.copyNotNullProperties(articleDTO, article);
            articleRepository.save(article);
        }

    }

    @Override
    @Transactional
    public void updateTagById(TagDTO tagDTO) {
        if(null != tagDTO.getTagId()){
            Tag tag = tagRepository.findById(tagDTO.getTagId()).get();
            JpaUtil.copyNotNullProperties(tagDTO, tag);
            tagRepository.save(tag);
        }
    }
}
