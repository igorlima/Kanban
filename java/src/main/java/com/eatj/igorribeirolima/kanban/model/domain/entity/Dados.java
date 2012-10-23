package com.eatj.igorribeirolima.kanban.model.domain.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table( name = "data" )
@JsonIgnoreProperties(ignoreUnknown=true)
public class Dados implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column( name = "id" )
	@GeneratedValue( strategy = GenerationType.AUTO )
	private Long id;

	@Column( name = "name" )
	private String name;
	
	@Column( name = "content" )
	private String content;
	
	@Column( name = "burndown" )
	private String burndown;
	
	@Column( name = "productbacklog" )
	private String productbacklog;
	
	public Dados(){
		
	}
	
	public Dados( String name ){
		setName(name);
	}
		
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBurndown() {
		return burndown;
	}

	public void setBurndown(String burndown) {
		this.burndown = burndown;
	}
	
	public String getProductbacklog() {
		return productbacklog;
	}

	public void setProductbacklog(String productbacklog) {
		this.productbacklog = productbacklog;
	}

	@Override
	public boolean equals( Object obj ) {

		if ( obj == null ) {
			return false;
		}
		if ( getClass() != obj.getClass() ) {
			return false;
		}
		final Dados other = ( Dados ) obj;
		if ( this.id != other.id && ( this.id == null || !this.id.equals( other.id ) ) ) {
			return false;
		}
		return true;

	}

	@Override
	public int hashCode() {

		int hash = 7;
		hash = 67 * hash + ( this.id != null ? this.id.hashCode() : 0 );
		return hash;

	}

	@Override
	public String toString() {
		return "Dados{" + "id=" + id + ", name=" + name + ", content=" + content + '}';
	}

}
