package services;

import java.util.List;

import dao.hotel.IDaoLocale;
import dao.hotel.IDaoRemote;
import entities.Hotel;
import entities.Ville;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@Stateless(name = "hotelserv")
public class HotelService implements IDaoRemote<Hotel>, IDaoLocale<Hotel> {
    
    @PersistenceContext
    private EntityManager em;

    @Override
    @Transactional
    public Hotel create(Hotel o) {
        em.persist(o);
        return o;
    }

    @Override
    @Transactional
    public boolean delete(Hotel o) {
        // Check if the entity is managed
        if (!em.contains(o)) {
            // If not managed, merge it into the persistence context
            o = em.merge(o);
        }

        em.remove(o);
        return true;
    }

    @Override
    @Transactional
    public Hotel update(Hotel updatedHotel) {
        // Check if the entity is managed
        if (!em.contains(updatedHotel)) {
            // If not managed, merge it into the persistence context
            updatedHotel = em.merge(updatedHotel);
        }

        // Update the existing entity with the changes
        updatedHotel = em.merge(updatedHotel);
        return updatedHotel;
    }

    @Override
    public Hotel findById(int id) {
        return em.find(Hotel.class, id);
    }

    @Override
    public List<Hotel> findAll() {
        Query query = em.createQuery("select h from Hotel h");
        return query.getResultList();
    }
    
    public List<Ville> getAllCities() {
    	TypedQuery<Ville> query = em.createQuery("SELECT v FROM Ville v", Ville.class);
        List<Ville> villes = query.getResultList();
        System.out.println("Number of cities from service: " + villes.size()); // Vérifiez la taille de la liste
        return villes;
    }
}