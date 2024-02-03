package org.website.blog.interfaces.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.website.blog.domain.entity.BaseEntity;
import org.website.blog.domain.entity.Tag;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TagDTO extends BaseEntity {
    private Integer tagId;

    private String tagName;

    public TagDTO(Tag tag){
        this.tagId = tag.getTagId();
        this.tagName = tag.getTagName();
        this.setCreateTime(tag.getCreateTime());
        this.setLastUpdateTime(tag.getLastUpdateTime());
        this.setIsDelete(tag.getIsDelete());
    }
}
