package org.website.blog.domain.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
public class BaseEntity implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;

    private Boolean isDelete;


    @Override
    public String toString() {
        return "BaseEntity{" +
                "createTime=" + createTime +
                ", lastUpdateTime=" + lastUpdateTime +
                ", isDelete=" + isDelete +
                '}';
    }
}
