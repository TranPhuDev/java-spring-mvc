package vn.tranphudev.laptopshop.repository;

import org.springframework.stereotype.Repository;

import vn.tranphudev.laptopshop.domain.Role;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
