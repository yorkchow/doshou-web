package me.doshou.front.entity;

import me.doshou.common.entity.BaseEntity;
import me.doshou.common.repository.support.annotation.EnableQueryCache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * 全局配置实体类
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:31
 */
@Entity
@Table(name = "config")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Config extends BaseEntity<Long> {

    @NotNull(message = "{not.null}")
    private String name;

    @NotNull(message = "{not.null}")
    private String value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
