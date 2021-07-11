package com.yidu.bean;

import org.springframework.stereotype.Component;
import java.io.Serializable;

@Component
public class Roleinfo implements Serializable {

  private Integer roleid;
  private String rolename;


  public long getRoleid() {
    return roleid;
  }

  public void setRoleid(Integer roleid) {
    this.roleid = roleid;
  }


  public String getRolename() {
    return rolename;
  }

  public void setRolename(String rolename) {
    this.rolename = rolename;
  }

  @Override
  public String toString() {
    return "Roleinfo{" +
            "roleid=" + roleid +
            ", rolename='" + rolename + '\'' +
            '}';
  }
}
