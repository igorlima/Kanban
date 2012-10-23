package com.eatj.igorribeirolima.kanban.model.service.bo;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Transactional;

import br.ufla.lemaf.commons.model.persistence.dao.annotation.DAO;
import br.ufla.lemaf.commons.model.persistence.dao.annotation.DAOImplementation;
import br.ufla.lemaf.commons.model.service.to.MessageReturnTO;
import br.ufla.lemaf.commons.model.service.to.ObjectReturnTO;
import br.ufla.lemaf.commons.model.service.to.ReturnTO;
import br.ufla.lemaf.commons.model.service.to.ReturnTO.Status;

import com.eatj.igorribeirolima.kanban.model.domain.entity.Dados;
import com.eatj.igorribeirolima.kanban.model.persistence.dao.DadosDAO;

@Named
public class DadosBO {

	private final Log log = LogFactory.getLog( getClass() );

	@Inject
	@DAO( implementation = DAOImplementation.HIBERNATE )
	private DadosDAO dao;

	@SuppressWarnings("unchecked")
	@Transactional
	public ReturnTO createOrUpdate( Dados dados ) {

		try {
			
			ReturnTO returnTO = retrieve(dados.getName());
			if( returnTO.getStatus().equals( ReturnTO.Status.SUCCESS ) ){
				Dados dadosBD = ( ( ObjectReturnTO<Dados> ) returnTO ).getReturnObject();
				dadosBD.setContent( dados.getContent() );
				dadosBD.setBurndown( dados.getBurndown() );
				dadosBD.setProductbacklog( dados.getProductbacklog() );
				dados = dadosBD;
			}
			
			this.log.debug( "Tentando criar ou atualizar um dado do kanban..." );
			this.dao.createOrUpdate( dados );
			this.log.debug( "Dado criado ou atualizado com sucesso!" );

			return new MessageReturnTO( Status.SUCCESS, "Dado salvo com sucesso!" );

		} catch ( Exception e ) {

			log.error( "Erro ao tentar criar ou atualizar um dado do kanban!", e );

			return new MessageReturnTO( Status.ERROR, "Não foi possível salvar o dado do kanban!" );

		}

	}

	@Transactional
	public ReturnTO retrieve( final Long id ) {

		try {

			this.log.debug( "Tentando recuperar um dado pelo ID..." );

			Dados document = this.dao.retrieve( id );

			this.log.debug( "Dado recuperado com sucesso pelo ID!" );

			return new ObjectReturnTO<Dados>( document );

		} catch ( Exception e ) {

			log.error( "Erro ao tentar recuperar um Dado pelo ID!", e );

			return new MessageReturnTO( Status.ERROR, "Não foi possível recuperar o dado do kanban!" );

		}

	}
	
	@Transactional(readOnly=true)
	public ReturnTO findAll() {

		try {

			this.log.debug( "Tentando recuperar todos os dados..." );

			List<Dados> dados = this.dao.retrieve( new Dados() );
			for( Dados dado : dados ) dado.setContent(null);
			
			this.log.debug( "Dados recuperados com sucesso!" );

			return new ObjectReturnTO<List<Dados>>( dados );

		}catch ( Exception e ) {
			
			log.error( "Erro ao tentar recuperar todos os dados!", e );
			return new MessageReturnTO( Status.ERROR, "Não foi possível recuperar todos os dados do kanban!" );

		}

	}
	
	@Transactional
	public ReturnTO retrieve( final String name ) {

		try {

			this.log.debug( "Tentando recuperar um dado pelo nome..." );

			Dados dados = this.dao.retrieve( new Dados(name) ).get(0);

			this.log.debug( "Dado recuperado com sucesso pelo nome!" );

			return new ObjectReturnTO<Dados>( dados );

		}catch( IndexOutOfBoundsException indexOutOfBoundsException){
			
			log.error( "Erro ao tentar recuperar um Dado pelo nome. Motivo: " + indexOutOfBoundsException.getMessage() + "!" );
			return new MessageReturnTO( Status.ERROR, "Não foi possível recuperar o dado do kanban!" );
			
		}catch ( Exception e ) {
			
			log.error( "Erro ao tentar recuperar um Dado pelo nome!", e );
			return new MessageReturnTO( Status.ERROR, "Não foi possível recuperar o dado do kanban!" );

		}

	}

	@Transactional
	public ReturnTO delete( final Dados dados ) {

		try {

			this.log.debug( "Tentando remover um Dado..." );

			this.dao.delete( dados );

			this.log.debug( "Dado removido com sucesso!" );

			return new MessageReturnTO( Status.SUCCESS, "Dado removido com sucesso!" );

		} catch ( Exception e ) {

			String message = "Não foi possível remover o dado do kanban!";

			log.error( message, e );

			return new MessageReturnTO( Status.ERROR, message );

		}

	}

}