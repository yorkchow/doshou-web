package me.doshou.front.utils;

import me.doshou.common.utils.LogUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 17:49
 */
public class FrontLogUtils {

    private static final Logger FRONT_LOGGER = LoggerFactory.getLogger("doshou-front");

    private Logger getFrontLogger() {
        return FRONT_LOGGER;
    }

    public static void log(String msg, Object... args) {
        FRONT_LOGGER.info(LogUtils.getBlock(msg), args);
    }
}
