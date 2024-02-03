package org.website.blog.domain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.website.blog.interfaces.dto.TagDTO;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@DynamicUpdate
@Table(name = "tag")
public class Tag extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tag_tag_id_seq")
    @SequenceGenerator(name = "tag_tag_id_seq", sequenceName = "tag_tag_id_seq", allocationSize = 1)
    private Integer tagId;

    private String tagName;

    public Tag(TagDTO tagDTO) {
        this.tagId = tagDTO.getTagId();
        this.tagName = tagDTO.getTagName();
        this.setCreateTime(tagDTO.getCreateTime());
        this.setLastUpdateTime(tagDTO.getLastUpdateTime());
        this.setIsDelete(tagDTO.getIsDelete());
    }
}
