package com.eatj.igorribeirolima.kanban.model.persistence.dao.hibernate;

import javax.inject.Named;

import br.ufla.lemaf.commons.model.persistence.dao.annotation.DAO;
import br.ufla.lemaf.commons.model.persistence.dao.annotation.DAOImplementation;
import br.ufla.lemaf.commons.model.persistence.dao.hibernate.HibernateDAO;

import com.eatj.igorribeirolima.kanban.model.domain.entity.Dados;
import com.eatj.igorribeirolima.kanban.model.persistence.dao.DadosDAO;

@Named
@DAO( implementation = DAOImplementation.HIBERNATE )
public class DadosHibernateDAO extends HibernateDAO<Dados, Long> implements DadosDAO {

}
