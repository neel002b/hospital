/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author chintan
 */
public class Specialist {
    
    private int id;
    private String specialistname;

    public Specialist(int id, String specialistname) {
        this.id = id;
        this.specialistname = specialistname;
    }

    public Specialist() {
    }

    public int getId() {
        return id;
    }

    public String getSpecialistname() {
        return specialistname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSpecialistname(String specialistname) {
        this.specialistname = specialistname;
    }
    
    
    
}
