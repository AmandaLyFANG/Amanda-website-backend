package org.website.blog.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.website.blog.domain.entity.Article;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer> {

    @Query(value = "SELECT article.* FROM article_tag_mapping LEFT JOIN article on article_tag_mapping.article_id = article.article_id WHERE article_tag_mapping.tag_id = ?1 ORDER BY ?#{#pageable}",
            countQuery = "SELECT count(*) FROM article_tag_mapping LEFT JOIN article on article_tag_mapping.article_id = article.article_id WHERE article_tag_mapping.tag_id = ?1",
            nativeQuery = true)
    Page<Article> findArticlesByTagId(Integer tagId, Pageable page);
}
