package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ville.IDaoLocale;
import entities.Ville;

/**
 * Servlet implementation class VilleController
 */
@WebServlet("/villeController")
public class VilleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IDaoLocale<Ville> ejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VilleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Create new city
            String nom = request.getParameter("ville");
            ejb.create(new Ville(nom));
        } else if ("delete".equals(action)) {
            // Delete city
            int villeId = Integer.parseInt(request.getParameter("id"));
            Ville villeToDelete = ejb.findById(villeId);
            ejb.delete(villeToDelete);
        } else if ("update".equals(action)) {
            // Update city
            int villeId = Integer.parseInt(request.getParameter("id"));
            String updatedNom = request.getParameter("updatedVille");
            Ville updatedVille = new Ville(updatedNom);
            updatedVille.setId(villeId);
            ejb.update(updatedVille);
        }

        // Retrieve and display the list of cities
        request.setAttribute("villes", ejb.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}