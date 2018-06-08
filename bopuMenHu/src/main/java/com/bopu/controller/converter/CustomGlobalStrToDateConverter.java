package com.bopu.controller.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomGlobalStrToDateConverter implements Converter<String, Date> {


    public Date convert(String source) {
        try {
            return	new SimpleDateFormat("yyyy-MM-dd YY:mm:ss").parse(source);
        } catch (ParseException e) {
            return null;
        }
    }
}
