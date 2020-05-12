package com.qf.authen.dao;
import com.qf.authen.entity.Datatype;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface DatatypeDao {
    //查询所有资料
    List<Datatype> findAll();

}
