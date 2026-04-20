package bk.atuan.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bk.atuan.laptopshop.domain.Cart;
import bk.atuan.laptopshop.domain.CartDetail;
import bk.atuan.laptopshop.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByProductAndCart(Product product, Cart cart);

    List<CartDetail> findByCart(Cart cart);

    CartDetail findById(long id);
}
