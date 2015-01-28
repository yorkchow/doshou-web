package me.doshou.admin.maintain.website.web.controller;

import me.doshou.common.Constants;
import me.doshou.common.entity.enums.BooleanEnum;
import me.doshou.common.entity.search.SearchOperator;
import me.doshou.common.entity.search.Searchable;
import me.doshou.common.utils.MessageUtils;
import me.doshou.common.web.bind.annotation.PageableDefaults;
import me.doshou.common.web.controller.BaseMultipartFileController;
import me.doshou.common.web.upload.FileUploadUtils;
import me.doshou.front.entity.Product;
import me.doshou.front.entity.Store;
import me.doshou.front.service.CategoryService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;

/**
 * doshou.me网站商铺管理
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2015/1/18
 * Time: 13:39
 */
@Controller
@RequestMapping("/admin/maintain/website/store")
@RequiresPermissions("maintain:website:store:*")
public class WebsiteStoreController extends BaseMultipartFileController<Store, Long> {

    private final String ROOT_DIR = "/";

    private final long MAX_SIZE = 2000000; //2MB
    private final String[] ALLOWED_EXTENSION = new String[] {
            "bmp","gif","jpeg", "jpg", "png"
    };

    @Autowired
    private ServletContext sc;

    @Autowired
    private CategoryService categoryService;

    public WebsiteStoreController() {
        setResourceIdentity("maintain:website:store");
    }

    @Override
    protected void setCommonData(Model model) {
        model.addAttribute("booleanList", BooleanEnum.values());
        Searchable searchable =
                Searchable.newSearchable()
                        .addSearchFilter("isShow", SearchOperator.eq, true)
                        .addSort(new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("categoryList", categoryService.findAllWithSort(searchable));
    }

    @RequestMapping(method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String list(Searchable searchable, Model model) {
        if (!SecurityUtils.getSubject().isPermitted("maintain:website:view")) {
            throw new UnauthorizedException(MessageUtils.message("no.view.permission", "maintain:website:view"));
        }
        return super.list(searchable, model);
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            HttpServletRequest request,
            Model model,
            @Valid @ModelAttribute("m") Store m, BindingResult result,
            @RequestParam(value = "file", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {

        if (file != null && !file.isEmpty()) {
            m.setImgUrl(File.separator + FileUploadUtils.upload(request, file, result));
        }
        return super.create(request, model, m, result, file, redirectAttributes);
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.POST)
    public String update(
            HttpServletRequest request,
            Model model, @Valid @ModelAttribute("m") Store m, BindingResult result,
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        if (file != null && !file.isEmpty()) {
            m.setImgUrl(File.separator + FileUploadUtils.upload(request, file, result));
        }
        return super.update(request, model, m, result, file, backURL, redirectAttributes);
    }


}
