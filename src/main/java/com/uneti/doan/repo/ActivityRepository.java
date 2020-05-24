package com.uneti.doan.repo;

import com.uneti.doan.common.model.Model;
import com.uneti.doan.entity.ActivityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface ActivityRepository extends JpaRepository<ActivityEntity, Long> {
    @Query("SELECT COUNT(a) FROM ActivityEntity a WHERE a.isContribute=?1")
    Long countByContributeTrue(boolean isContribute);

    @Query("SELECT MAX (a.createdDate) FROM ActivityEntity a")
    Date getMaxDate();

}
