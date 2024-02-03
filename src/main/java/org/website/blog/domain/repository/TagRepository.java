package org.website.blog.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.website.blog.domain.entity.Article;
import org.website.blog.domain.entity.Tag;

import java.util.List;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {
    @Query(value = "SELECT tag.* FROM article_tag_mapping LEFT JOIN tag ON article_tag_mapping.tag_id = tag.tag_id WHERE article_tag_mapping.article_id=?1",
            nativeQuery = true)
    List<Tag> findTagsByArticleId(Integer articleId);
}
