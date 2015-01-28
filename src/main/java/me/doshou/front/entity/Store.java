package me.doshou.front.entity;

import me.doshou.common.entity.BaseEntity;
import me.doshou.common.repository.support.annotation.EnableQueryCache;
import me.doshou.front.entity.Category;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 商铺实体类
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:26
 */
@Entity
@Table(name = "store")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Store extends BaseEntity<Long> {

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @JoinColumn(name="cat_id")
    private Category category;

    @NotNull(message = "{not.null}")
    private String name;

    @NotNull(message = "{not.null}")
    private String url;

    @NotNull(message = "{not.null}")
    @Column(name="img_url")
    private String imgUrl;

    @Column(name = "is_show")
    private Boolean isShow = Boolean.FALSE;         /** 是否显示，删除的设置False */

    @Column(name = "sort_order")
    private Integer sortOrder;      /** 商品显示顺序，数字越小显示越前面 */

    /**
     * 创建时间
     */
    @Column(name="add_date", nullable=false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date addDate;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }
}
