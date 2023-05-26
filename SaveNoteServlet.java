package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.KeepNotes.dao.KeepNotes_dao;
import com.entities.Note;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			//fetch title,content
			String title=request.getParameter("title");
			String content= request.getParameter("content");
			
			Note note= new Note(title, content, new Date());
			
			KeepNotes_dao dao= new KeepNotes_dao();
			dao.saveNote(note);
			

			PrintWriter out= response.getWriter();
			out.println("<h1 style='text-align:center;'>Note added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all Notes</a></h1>");
			
		}catch(Exception e) 
		{
			e.printStackTrace();
		}
		
	}

}
