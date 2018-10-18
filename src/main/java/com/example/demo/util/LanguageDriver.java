package com.example.demo.util;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.parsing.XNode;
import org.apache.ibatis.session.Configuration;

public interface LanguageDriver {
    ParameterHandler createParameterHandler(MappedStatement var1, Object var2, BoundSql var3);

    SqlSource createSqlSource(Configuration var1, XNode var2, Class<?> var3);

    SqlSource createSqlSource(Configuration var1, String var2, Class<?> var3);
}
