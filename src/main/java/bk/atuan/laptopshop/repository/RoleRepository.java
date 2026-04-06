package bk.atuan.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import bk.atuan.laptopshop.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
