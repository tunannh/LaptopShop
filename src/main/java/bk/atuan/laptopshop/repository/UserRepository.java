package bk.atuan.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import bk.atuan.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // User save(User user);
    User findById(long id);

    void deleteById(long id);

    boolean existsByEmail(String email);
}
