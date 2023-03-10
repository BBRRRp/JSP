package com.lec.product;

import java.util.ArrayList;

public class ProductList {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public ProductList() {
		
		Product phone = new Product("P1234", "iphone", 800000);
		phone.setDescription("4.17-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("NEW");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core Processor");
		tablet.setCategory("tablet");
		tablet.setManufacturer("SAMSUNG");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			
			if(product !=null && product.getProductId() !=null
					&& product.getProductId().equals(productId)) {
					
				productById = product;
				break;
			}
		}
		
		return productById;
	}

}