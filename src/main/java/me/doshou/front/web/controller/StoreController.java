package me.doshou.front.web.controller;

import me.doshou.common.Constants;
import me.doshou.common.entity.search.SearchOperator;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.web.controller.BaseController;
import me.doshou.front.entity.Category;
import me.doshou.front.entity.Store;
import me.doshou.front.service.CategoryService;
import me.doshou.front.service.ConfigService;
import me.doshou.front.service.StoreService;
import me.doshou.front.utils.FrontLogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Store Controller
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 18:52
 */
@Controller
@RequestMapping(value = "/store")
public class StoreController extends BaseController<Store, Long> {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ConfigService configService;

    @Autowired
    private StoreService storeService;

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

        List<Store> stores = this.storeService.findAllWithSort(searchable);
        model.addAttribute("stores", stores);

        FrontLogUtils.log("Request URL: [/], stores: {}", stores);

        return "front/stores";
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

        List<Store> stores = this.storeService.findAllWithSort(searchable);
        model.addAttribute("stores", stores);

        FrontLogUtils.log("Request URL: [/], stores: {}", stores);

        return "front/stores";
    }
}
