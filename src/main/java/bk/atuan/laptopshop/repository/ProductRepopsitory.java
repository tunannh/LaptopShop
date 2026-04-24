package bk.atuan.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import bk.atuan.laptopshop.domain.Product;

@Repository
public interface ProductRepopsitory extends JpaRepository<Product, Long> {
    @NonNull
    List<Product> findAll();

    Product findById(long id);

    Page<Product> findAll(Pageable pageable);
}
