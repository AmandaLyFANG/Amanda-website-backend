package org.website.blog.domain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.website.blog.interfaces.dto.ArticleDTO;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@DynamicUpdate
@Table(name = "article")
public class Article extends BaseEntity{
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE, generator = "article_article_id_seq")
    @SequenceGenerator(name = "article_article_id_seq", sequenceName = "article_article_id_seq", allocationSize = 1)
    private Integer articleId;

    private String title;

    private String content;

    private String keyword;

    private Boolean isOriginal;

    public Article(ArticleDTO articleDTO){
        this.articleId = articleDTO.getArticleId();
        this.title = articleDTO.getTitle();
        this.content = articleDTO.getContent();
        this.keyword = articleDTO.getKeyword();
        this.isOriginal = articleDTO.getIsOriginal();
        this.setCreateTime(articleDTO.getCreateTime());
        this.setLastUpdateTime(articleDTO.getLastUpdateTime());
        this.setIsDelete(articleDTO.getIsDelete());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Article article = (Article) o;
        return Objects.equals(articleId, article.articleId) && Objects.equals(title, article.title) && Objects.equals(content, article.content) && Objects.equals(keyword, article.keyword) && Objects.equals(isOriginal, article.isOriginal);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), articleId, title, content, keyword, isOriginal);
    }
}
