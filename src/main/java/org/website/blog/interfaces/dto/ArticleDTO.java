package org.website.blog.interfaces.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.website.blog.domain.entity.Article;
import org.website.blog.domain.entity.BaseEntity;
import org.website.blog.domain.entity.Tag;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDTO extends BaseEntity {
    private Integer articleId;

    private String title;

    private String content;

    private String keyword;
    private Boolean isOriginal;

    private List<TagDTO> tagDTOList;

    public ArticleDTO(Article article){
        this.articleId = article.getArticleId();
        this.title = article.getTitle();
        this.content = article.getContent();
        this.keyword = article.getKeyword();
        this.isOriginal = article.getIsOriginal();
        this.setCreateTime(article.getCreateTime());
        this.setLastUpdateTime(article.getLastUpdateTime());
        this.setIsDelete(article.getIsDelete());
    }
}
