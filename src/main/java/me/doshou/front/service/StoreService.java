package me.doshou.front.service;

import me.doshou.common.service.BaseService;
import me.doshou.front.entity.Store;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 18:00
 */
@Service
public class StoreService extends BaseService<Store, Long> {

    public Store save(Store store) {
        if (store.getAddDate() == null) {
            store.setAddDate(new Date());
        }
        return super.save(store);
    }
}
