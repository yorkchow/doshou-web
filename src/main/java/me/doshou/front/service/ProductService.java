package me.doshou.front.service;

import me.doshou.common.service.BaseService;
import me.doshou.front.entity.Product;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:41
 */
@Service
public class ProductService extends BaseService<Product, Long> {

    public Product save(Product product) {
        if (product.getAddDate() == null) {
            product.setAddDate(new Date());
        }
        product.setShopPrice(product.getShopPrice() * 100);
        product.setMarketPrice(product.getMarketPrice() * 100);
        return super.save(product);
    }
}
