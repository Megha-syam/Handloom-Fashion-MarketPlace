package com.klu.project.HFMP.controller;

import java.awt.PageAttributes.MediaType;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klu.project.HFMP.model.Product;
import com.klu.project.HFMP.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

    @Autowired
    private ProductService productservice;

    @GetMapping("addproduct")
    public ModelAndView addProduct() {
        return new ModelAndView("addproduct");
    }

    @GetMapping("viewallproducts")
    public ModelAndView viewallproducts() {
        List<Product> productlist = productservice.ViewAllProducts();
        ModelAndView mv = new ModelAndView("viewallproducts");
        mv.addObject("productlist", productlist);
        return mv; // Corrected syntax
    }
    


    @PostMapping("insertproduct")
    public ModelAndView insertProductDemo(HttpServletRequest request, @RequestParam("pimage") MultipartFile file) {
        String msg;
        ModelAndView mv = new ModelAndView();

        try {
            String name = request.getParameter("pname");
            String description = request.getParameter("pdescription");
            Double cost = Double.valueOf(request.getParameter("pcost"));

            byte[] bytes = file.getBytes();
            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes); // Creates a Blob object from the byte array.

            Product product = new Product();
            product.setPname(name);
            product.setPdescription(description);
            product.setPcost(cost);
            product.setImage(blob);

            msg = productservice.AddProduct(product);
            System.out.println(msg);

            mv.setViewName("addproduct");
            mv.addObject("message", "Product added successfully!");

        } catch (Exception e) {
            msg = e.getMessage();
            System.out.println(msg);
            mv.setViewName("addproduct");
            mv.addObject("message", "Error adding product: " + msg);
        }

        return mv;
    }
}
