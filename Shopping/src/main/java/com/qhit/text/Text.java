package com.qhit.text;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Text {
    public static void main(String[] args) {
        SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(simpleDateFormat.format(new Date()));
    }

}
