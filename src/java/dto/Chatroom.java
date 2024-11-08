/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Raiku
 */
public class Chatroom {
    private int roomId;
    private User user1;
    private User user2;
    private List<Message> messages;
    
    public Chatroom() {
    }
    
    public Chatroom(User user1, User user2) {
        this.user1 = user1;
        this.user2 = user2;
    }

    public Chatroom(int roomId, User user1, User user2) {
        this.roomId = roomId;
        this.user1 = user1;
        this.user2 = user2;
    }

    public Chatroom(int roomId, User user1, User user2, List<Message> messages) {
        this.roomId = roomId;
        this.user1 = user1;
        this.user2 = user2;
        this.messages = messages;
    }
    

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
    

    @Override
    public String toString() {
        return "dto.Chatroom[ roomId=" + roomId + " ]";
    }

}
