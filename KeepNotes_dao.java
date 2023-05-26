package com.KeepNotes.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.hibernate.Query;
import org.hibernate.Session;

import com.entities.Note;



public class KeepNotes_dao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();
	
	public void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
	
	public void saveNote(Note note) {
		transaction.begin();
		manager.persist(note);
		transaction.commit();
	}
	
	public void showNote(List<Note> note) {
		transaction.begin();
		Note notes= manager.find(Note.class, note);
		List<Note> newNote= notes.getNote();
		newNote.addAll(note);
		notes.setNote(newNote);
		manager.merge(notes);
		for(Note allnotes: newNote) {
			System.out.println(allnotes );
		}
		transaction.commit();
	} 
	
	
}
