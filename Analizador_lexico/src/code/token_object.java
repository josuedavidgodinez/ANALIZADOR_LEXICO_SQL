/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

/**
 *
 * @author godin
 */
public class token_object {
 private Tokens token ;
private int line;
private int first_columnn;

    public Tokens getToken() {
        return token;
    }

    public void setToken(Tokens token) {
        this.token = token;
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public int getFirst_columnn() {
        return first_columnn;
    }

    public void setFirst_columnn(int first_columnn) {
        this.first_columnn = first_columnn;
    }

    public int getLast_columnn() {
        return last_columnn;
    }

    public void setLast_columnn(int last_columnn) {
        this.last_columnn = last_columnn;
    }
private int last_columnn;
}
