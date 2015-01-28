package me.doshou.common.repository.hibernate.type;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 20:06
 */
public class JsonMap implements Serializable {

    private Map<Object, Object> map;

    public JsonMap() {
    }

    public JsonMap(Map<Object, Object> map) {
        this.map = map;
    }

    public Map<Object, Object> getMap() {
        if (map == null) {
            map = Maps.newHashMap();
        }
        return map;
    }

    public void setMap(Map<Object, Object> map) {
        this.map = map;
    }
}