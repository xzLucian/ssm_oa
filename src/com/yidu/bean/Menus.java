package com.yidu.bean;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author XiongAiWen
 * @version 1.0
 * @description:
 * @data 2021/1/12 15:03
 */
@Component
public class Menus {
    private String id;
    private String title;
    private String href;
    private String field;
    private boolean spread=true;
    private boolean checked=false;
    private List<Menus> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public List<Menus> getChildren() {
        return children;
    }

    public void setChildren(List<Menus> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menus{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", href='" + href + '\'' +
                ", field='" + field + '\'' +
                ", spread=" + spread +
                ", checked=" + checked +
                ", children=" + children +
                '}';
    }
}
