package com.bilel.SpringBoot_TP01.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bilel.SpringBoot_TP01.entities.Produit;
import com.bilel.SpringBoot_TP01.services.ProduitService;

@Controller
public class ProduitController {
	
	@Autowired
	ProduitService produitsService;
	
	@GetMapping("/create")
	public String createProduitPage() {
		return "createProduit";
	}
	
	@PostMapping("/saveProduit")
	public String saveProduit(@ModelAttribute("produit") Produit produit, @RequestParam("date") String date, ModelMap modelMap) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date dateCreation = dateFormat.parse(date);
		produit.setDateCreation(dateCreation);
		
		Produit savedProduit = this.produitsService.saveProduit(produit);
		String msg = "Produit Avec ID : " + savedProduit.getIdProduit() + " Enregistrer Avec Succes";
		modelMap.addAttribute("msg", msg);
		
		return "createProduit";
	}
	
	@GetMapping("/lister")
	public String listeProduits(ModelMap modelMap) {
		List<Produit> produits = this.produitsService.getAllProduits();
		modelMap.addAttribute("produits", produits);
		return "listerProduits";
	}
	
	@GetMapping("/editerProduit")
	public String editerProduPage(@RequestParam("id") Long id, ModelMap modelMap) {
		Produit produit = this.produitsService.getProduit(id);
		modelMap.addAttribute("produit", produit);
		return "editerProduit";
	}
	
	@PostMapping("/editerProduit")
	public String editerProduit(@ModelAttribute("produit") Produit produit, @RequestParam("date") String date, ModelMap modelMap) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date dateCreation = dateFormat.parse(date);
		produit.setDateCreation(dateCreation);
		
		this.produitsService.updateProduit(produit);
		
		List<Produit> prods = this.produitsService.getAllProduits();
		modelMap.addAttribute("produits", prods);
		return "listerProduits";
	}
	
	@GetMapping("/supprimerProduit")
	public String supprimerProduit(@RequestParam("id") Long id, ModelMap modelMap) {
		this.produitsService.deleteProduitById(id);
		List<Produit> prods = this.produitsService.getAllProduits();
		modelMap.addAttribute("produits", prods);
		return "listerProduits";
	}
}