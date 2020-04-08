
package com.qhit.utils;


import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


/**

 * Created by lang_xy on 2018/1/24 9:45.

 * 生成器

 * dao pojo mapper

 * resources文件夹下的generator.properties为参数文件夹

 * resources文件夹下的generatorConfig.xml为配置文件夹

 * 只需修改generatorConfig.xml的table标签里面的tableName和domainObjectName

 * tableName为数据表名称

 * domainObjectName为数据表名称（*第一个字母为大写*）

 * 生成的文件在resources文件夹下的dao、mappers、pojo文件夹中

 */

public class Generator {



    public static void main(String[] args) {

        List<String> warnings = new ArrayList();

        boolean overwrite = true;

        File configFile = new File("src/main/resources/mybatis-generator-config.xml");

        ConfigurationParser cp = new ConfigurationParser(warnings);

        try {

            Configuration config = cp.parseConfiguration(configFile);

            DefaultShellCallback callback = new DefaultShellCallback(overwrite);

            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);

            myBatisGenerator.generate(null);

            System.out.println("Is Success");

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}
