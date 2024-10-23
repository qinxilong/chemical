package com.ruoyi.chemical.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * IOT接口调用返回值
 * @author
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ModelResponse {
    private int code;
    private String message;
    private String error;
}
