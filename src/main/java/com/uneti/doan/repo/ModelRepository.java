package com.uneti.doan.repo;

import com.uneti.doan.common.model.Model;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface ModelRepository extends JpaRepository<Model, Long> {
}
