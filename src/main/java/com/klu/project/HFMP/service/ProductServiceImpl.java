package com.klu.project.HFMP.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.project.HFMP.model.Product;
import com.klu.project.HFMP.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productrepo;
	
	@Override
	public String AddProduct(Product product) 
	{
		productrepo.save(product);
		return "Product Added Successfully";
	}

	@Override
	public List<Product> ViewAllProducts() 
	{
		return (List<Product>) productrepo.findAll();
	}

}
