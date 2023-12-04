package services;

import java.util.List;

import dao.ville.IDaoLocale;
import dao.ville.IDaoRemote;
import entities.Ville;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Stateless(name = "kenza")
public class VilleService implements IDaoRemote<Ville>, IDaoLocale<Ville> {
    
    @PersistenceContext
    private EntityManager em;

    @Override
    @Transactional
    public Ville create(Ville o) {
        em.persist(o);
        return o;
    }

    @Override
    @Transactional
    public boolean delete(Ville o) {
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
    public Ville update(Ville updatedVille) {
        // Check if the entity is managed
        if (!em.contains(updatedVille)) {
            // If not managed, merge it into the persistence context
            updatedVille = em.merge(updatedVille);
        }

        // Update the existing entity with the changes
        updatedVille = em.merge(updatedVille);
        return updatedVille;
    }

    @Override
    public Ville findById(int id) {
        return em.find(Ville.class, id);
    }

    @Override
    public List<Ville> findAll() {
        Query query = em.createQuery("select v from Ville v");
        return query.getResultList();
    }
}