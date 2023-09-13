package fu.swp.dorm_mnm.config;

import fu.swp.dorm_mnm.entities.User;
import org.hibernate.HibernateException;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import java.util.Properties;

public class HibernateUtils {
    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            //set up connecttion between app and mysql
            Properties properties = new Properties();

            properties.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
            properties.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
            properties.put(Environment.URL, "jdbc:mysql://localhost:3406/dormitory_management");
            properties.put(Environment.USER, "root");
            properties.put(Environment.PASS, "123456");
            properties.put(Environment.SHOW_SQL, "true");
            properties.put(Environment.HBM2DDL_AUTO, "update");
            properties.put(Environment.USE_SECOND_LEVEL_CACHE, "true");
            properties.put(Environment.CACHE_REGION_FACTORY, "org.hibernate.cache.ehcache.EhCacheRegionFactory");
            configuration.setProperties(properties);

            sessionFactory = configuration.buildSessionFactory();
        } catch (HibernateException e) {

        }
    }

    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }

    public static void shutdown(){
        getSessionFactory().close();
    }
}
