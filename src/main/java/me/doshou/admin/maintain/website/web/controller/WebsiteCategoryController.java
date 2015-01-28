package me.doshou.admin.maintain.website.web.controller;

import me.doshou.common.entity.enums.BooleanEnum;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.utils.MessageUtils;
import me.doshou.common.web.bind.annotation.PageableDefaults;
import me.doshou.common.web.controller.BaseCRUDController;
import me.doshou.front.entity.Category;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * doshou.me网站商品类别管理
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2015/1/25
 * Time: 0:38
 */
@Controller
@RequestMapping("/admin/maintain/website/category")
@RequiresPermissions("maintain:website:category:*")
public class WebsiteCategoryController extends BaseCRUDController<Category, Long> {

    public WebsiteCategoryController() {
        setResourceIdentity("maintain:website:category");
    }

    @Override
    protected void setCommonData(Model model) {
        model.addAttribute("booleanList", BooleanEnum.values());
    }

    @RequestMapping(method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String list(Searchable searchable, Model model) {
        if (!SecurityUtils.getSubject().isPermitted("maintain:website:view")) {
            throw new UnauthorizedException(MessageUtils.message("no.view.permission", "maintain:website:view"));
        }
        return super.list(searchable, model);
    }

}
