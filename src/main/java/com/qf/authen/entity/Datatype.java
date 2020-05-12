package com.qf.authen.entity;

public class Datatype {
    private Integer id;
    private String typename;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "Datatype{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                '}';
    }
}
