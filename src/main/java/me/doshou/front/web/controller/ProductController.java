package me.doshou.front.web.controller;

import me.doshou.common.Constants;
import me.doshou.common.entity.search.SearchOperator;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.web.controller.BaseController;
import me.doshou.front.entity.Category;
import me.doshou.front.entity.Product;
import me.doshou.front.service.CategoryService;
import me.doshou.front.service.ConfigService;
import me.doshou.front.service.ProductService;
import me.doshou.front.utils.FrontLogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Product Controller
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:42
 */
@Controller
@RequestMapping(value = "/")
public class ProductController extends BaseController<Product, Long> {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ConfigService configService;

    @RequestMapping(value = {""})
    public String index(Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE).getValue());
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS).getValue());

        Searchable searchable =
                Searchable.newSearchable()
                        .addSearchFilter("isShow", SearchOperator.eq, true)
                        .addSort(new Sort(Sort.Direction.ASC, "sortOrder"));

        List<Category> categories = this.categoryService.findAllWithSort(searchable);
        model.addAttribute("cats", categories);

        FrontLogUtils.log("Request URL: [/], cats: {}", categories);

        List<Product> products = this.productService.findAllWithSort(searchable);
        model.addAttribute("products", products);

        FrontLogUtils.log("Request URL: [/], products: {}", products);

        return "front/products";
    }

    @RequestMapping(value = "all")
    public String listAll(Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE).getValue());
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS).getValue());

        Searchable searchable =
                Searchable.newSearchable()
                        .addSearchFilter("isShow", SearchOperator.eq, true)
                        .addSort(new Sort(Sort.Direction.ASC, "sortOrder"));

        List<Category> categories = this.categoryService.findAllWithSort(searchable);
        model.addAttribute("cats", categories);

        FrontLogUtils.log("Request URL: [/], cats: {}", categories);

        List<Product> products = this.productService.findAllWithSort(searchable);
        model.addAttribute("products", products);

        FrontLogUtils.log("Request URL: [/], products: {}", products);

        return "front/products";
    }

    @RequestMapping(value="cat/{catId}")
    public String show(@PathVariable(value="catId") Long catId, Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE).getValue());
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS).getValue());

        Searchable searchable =
                Searchable.newSearchable()
                        .addSearchFilter("isShow", SearchOperator.eq, true)
                        .addSort(new Sort(Sort.Direction.ASC, "sortOrder"));

        List<Category> categories = this.categoryService.findAllWithSort(searchable);
        model.addAttribute("cats", categories);

        FrontLogUtils.log("Request URL: [/], cats: {}", categories);

        Category category = this.categoryService.findOne(catId);
        searchable =
                Searchable.newSearchable()
                        .addSearchFilter("category", SearchOperator.eq, category)
                        .addSearchFilter("isShow", SearchOperator.eq, true)
                        .addSort(new Sort(Sort.Direction.ASC, "sortOrder"));

        List<Product> products = this.productService.findAllWithSort(searchable);
        model.addAttribute("products", products);

        FrontLogUtils.log("Request URL: [/], products: {}", products);

        return "front/products";
    }
}
