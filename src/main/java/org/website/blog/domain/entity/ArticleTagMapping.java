package org.website.blog.domain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "article_tag_mapping")
public class ArticleTagMapping {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "article_tag_mapping_article_tag_mapping_id_seq")
    @SequenceGenerator(name = "article_tag_mapping_article_tag_mapping_id_seq", sequenceName = "article_tag_mapping_article_tag_mapping_id_seq", allocationSize = 1)
    private Integer articleTagMappingId;
    private Integer tagId;

    private Integer articleId;

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }
}
