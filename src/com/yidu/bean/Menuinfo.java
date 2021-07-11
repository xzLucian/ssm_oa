package com.yidu.bean;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
public class Menuinfo implements Serializable {

  private String menuid;
  private String title;
  private Integer state;
  private String url;
  private String pid;
  private String iconCls;


  public String getMenuid() {
    return menuid;
  }

  public void setMenuid(String menuid) {
    this.menuid = menuid;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public long getState() {
    return state;
  }

  public void setState(Integer state) {
    this.state = state;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public String getPid() {
    return pid;
  }

  public void setPid(String pid) {
    this.pid = pid;
  }


  public String getIconCls() {
    return iconCls;
  }

  public void setIconCls(String iconCls) {
    this.iconCls = iconCls;
  }

  @Override
  public String toString() {
    return "Menuinfo{" +
            "menuid='" + menuid + '\'' +
            ", title='" + title + '\'' +
            ", state=" + state +
            ", url='" + url + '\'' +
            ", pid='" + pid + '\'' +
            ", iconCls='" + iconCls + '\'' +
            '}';
  }
}
