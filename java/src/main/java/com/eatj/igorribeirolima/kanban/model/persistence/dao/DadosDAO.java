package com.eatj.igorribeirolima.kanban.model.persistence.dao;

import java.util.List;

import br.ufla.lemaf.commons.model.persistence.dao.DAO;

import com.eatj.igorribeirolima.kanban.model.domain.entity.Dados;

public interface DadosDAO extends DAO<Dados, Long> {
	
	List<Dados> retrieve( final Dados dados );
	
}
