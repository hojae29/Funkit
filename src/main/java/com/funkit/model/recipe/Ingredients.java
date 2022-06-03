package com.funkit.model.recipe;

public class Ingredients {

    private int code;
    private String ingreName;
    private String ingreQua;

    public Ingredients(String ingreName,String ingreQua) {
        this.ingreName = ingreName;
        this.ingreQua = ingreQua;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getIngreName() {
        return ingreName;
    }

    public void setIngreName(String ingreName) {
        this.ingreName = ingreName;
    }

    public String getIngreQua() {
        return ingreQua;
    }

    public void setIngreQua(String ingreQua) {
        this.ingreQua = ingreQua;
    }

    @Override
    public String toString() {
        return "Ingredients{" +
                "code=" + code +
                ", ingreName='" + ingreName + '\'' +
                ", ingreQua='" + ingreQua + '\'' +
                '}';
    }
}
