package productcrudapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import productcrudapp.model.Product;

@Component
public class ProductDao {
	@Autowired
	private HibernateTemplate hibernateTemplate ;
	// create 
	@Transactional
	public void createProduct(Product product) {
		this.hibernateTemplate.save(product);
	}
	//get allproducts
	public List<Product> getProducts(){
		 List<Product> products =this.hibernateTemplate.loadAll(Product.class);
		 return products ;
	}
	@Transactional
	public void deleteProduct(int pid) {
		Product p =this.hibernateTemplate.load(Product.class , pid);
		this.hibernateTemplate.delete(p);
		
	}
	public Product getProduct(int pid) {
		return this.hibernateTemplate.get(Product.class, pid);
		
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
}
