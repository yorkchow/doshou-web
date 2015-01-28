package me.doshou.front.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.front.entity.Config;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:36
 */
public interface ConfigRepository extends BaseRepository<Config, Long> {

    Config findByName(String name);
}
