package com.eatj.igorribeirolima.kanban.controller;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.ufla.lemaf.commons.model.service.to.ReturnTO;

import com.eatj.igorribeirolima.kanban.model.domain.entity.Dados;
import com.eatj.igorribeirolima.kanban.model.service.bo.DadosBO;

@Named
@RequestMapping( value = "/**" )
public class DadosController {

	@Inject
	private DadosBO bo;

	@RequestMapping( value = "/dados", method = RequestMethod.GET )
	public ReturnTO retrieveAll() {
		return this.bo.findAll();
	}
	
	@RequestMapping( value = "/name/{name}", method = RequestMethod.GET )
	public ReturnTO retrieve( @PathVariable String name ) {
		
		return this.bo.retrieve(name);
		
	}
	
	@RequestMapping( value = "/dados", method = RequestMethod.POST )
	public ReturnTO save( @RequestBody Dados dados ) {
		
		return this.bo.createOrUpdate( dados );
		
	}
	
}
