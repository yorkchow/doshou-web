package me.doshou.front.service;

import me.doshou.common.service.BaseService;
import me.doshou.front.entity.Config;
import me.doshou.front.repository.ConfigRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:59
 */
@Service
public class ConfigService extends BaseService<Config, Long> {

    @Autowired
    private ConfigRepository getConfigRepository() {
        return (ConfigRepository) baseRepository;
    }

    public Config getValue(String name) {
        return getConfigRepository().findByName(name);
    }


}
