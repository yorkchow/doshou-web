package me.doshou.front.entity;

import me.doshou.common.entity.BaseEntity;
import me.doshou.common.repository.support.annotation.EnableQueryCache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 商品实体类
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:03
 */
@Entity
@Table(name = "product")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Product extends BaseEntity<Long> {

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    @JoinColumn(name="cat_id")
    private Category category;

    @NotNull(message = "{not.null}")
    private String brief;

    @NotNull(message = "{not.null}")
    private String url;

    @NotNull(message = "{not.null}")
    @Column(name="img_url")
    private String imgUrl;

    @Column(name = "market_price")
    private Integer marketPrice;    /** 市场价（原价）*/

    @Column(name = "shop_price")
    private Integer shopPrice;      /** 现价 */

    private Integer sales;          /** （月）销量 */

    private Integer comments;       /** （累计）评论数 */

    @Column(name="is_best")
    private Boolean isBest = Boolean.FALSE;         /** 是否精品 */

    @Column(name="is_hot")
    private Boolean isHot = Boolean.FALSE;          /** 是否热卖 */

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

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
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

    public Integer getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Integer marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Integer getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Integer shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public Boolean getIsBest() {
        return isBest;
    }

    public void setIsBest(Boolean isBest) {
        this.isBest = isBest;
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
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
