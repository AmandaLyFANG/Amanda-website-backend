package org.website.blog.interfaces.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseDTO {

    private Date createTime;

    private Date lastUpdateTime;

    private Boolean isDelete;
}
