package com.liucan.Utils;


public class AjaxResult {

    private Boolean success = true;

    private Object data;

    public AjaxResult() {
    }

    public AjaxResult(Boolean success, Object data) {
        this.success = success;
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
