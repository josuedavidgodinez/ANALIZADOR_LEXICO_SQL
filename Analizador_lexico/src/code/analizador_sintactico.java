/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import com.sun.org.apache.bcel.internal.generic.GOTO;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import javafx.beans.binding.Bindings;
import javax.swing.JOptionPane;

/**
 *
 * @author godin
 */
public class analizador_sintactico {

    public List<token_object> lista_tokens = new ArrayList<>();
    public List<String> lista_errores = new ArrayList<>();
    token_object lookahed;
    token_object anterior;

    public void analizar() {

        lookahed = lista_tokens.remove(0);
        inicio();
    }

    public void error(Tokens token) {
        print_error(token, lookahed);
        vaciar_hasta_punto_coma();

        if (lookahed.getToken() != Tokens.final_texto) {
            next();
            if (lookahed.getToken() == Tokens.punto_coma) {
                next();

            } else if (lookahed.getToken() == Tokens.GO) {
                next();
            }
            inicio();
        }
    }

    public void error(Tokens token, Tokens token2) {
        print_error(token, token2, lookahed);
        vaciar_hasta_punto_coma();

        if (lookahed.getToken() != Tokens.final_texto) {
            next();
            if (lookahed.getToken() == Tokens.punto_coma) {
                next();

            } else if (lookahed.getToken() == Tokens.GO) {
                next();
            }
            inicio();
        }
    }

    public void error(Tokens token, Tokens token2, Tokens token3) {
        print_error(token, token2, token3, lookahed);
        vaciar_hasta_punto_coma();

        if (lookahed.getToken() != Tokens.final_texto) {
            next();
            if (lookahed.getToken() == Tokens.punto_coma) {
                next();

            } else if (lookahed.getToken() == Tokens.GO) {
                next();
            }
            inicio();
        }
    }

    public void error(Tokens token, Tokens token2, Tokens token3, Tokens token4) {
        print_error(token, token2, token3, token4, lookahed);
        vaciar_hasta_punto_coma();

        if (lookahed.getToken() != Tokens.final_texto) {
            next();
            if (lookahed.getToken() == Tokens.punto_coma) {
                next();

            } else if (lookahed.getToken() == Tokens.GO) {
                next();
            }
            inicio();
        }
    }

    public void error(Tokens token, Tokens token2, Tokens token3, Tokens token4, Tokens token5) {
        print_error(token, token2, token3, token4, token5, lookahed);
        vaciar_hasta_punto_coma();

        if (lookahed.getToken() != Tokens.final_texto) {
            next();
            if (lookahed.getToken() == Tokens.punto_coma) {
                next();

            } else if (lookahed.getToken() == Tokens.GO) {
                next();
            }
            inicio();
        }
    }

    public void finalizar() {

        if (lookahed.getToken() == Tokens.GO) {
            match(Tokens.GO);
            if (lookahed.getToken() == Tokens.punto_coma) {
                match(Tokens.punto_coma);
            }
        } else if (lookahed.getToken() == Tokens.punto_coma) {
            match(Tokens.punto_coma);
            if (lookahed.getToken() == Tokens.GO) {
                match(Tokens.GO);
            }
        }

        if (null == lookahed.getToken() || lookahed.getToken() == Tokens.final_texto) {
            lista_errores.add("su codigo se termino de analizar sintacticamente");
            JOptionPane.showMessageDialog(null, lista_errores);
            System.exit(0);
        } else {

            //quiere decir que el el token ya termina 
            inicio();//regresar el inicio para analizar otro statment

        }

    }

    public void next() {
        anterior = lookahed;
        lookahed = lista_tokens.remove(0);

    }

    private void vaciar_hasta_punto_coma() {
        //  sacar todos los tokens hasta punto y coma

        while (lookahed.getToken() != Tokens.punto_coma && lookahed.getToken() != Tokens.GO && lookahed.getToken() != Tokens.final_texto) {

            next();
        }

    }

    private void match(Tokens token) {

        if (lookahed.getToken() == token) {
            next();
        } else {
            error(token);
            //ignorar_hasta_encontrar_punto_y_coma(); en caso de ignorar tokens hasta que finalize el statment 
            //en caso de analizar hasta el final

            //si viene un punto y coma no hacer next();
            //este if quiere decir que no termino el statment porque entro en token erroneo no esperado y lo termino con punto y coma
            //next(); en caso de seguir analizando hasta el final
        }

    }

    private void print_error(Tokens token, token_object look) {
        String message = " ";
        message = "Error de sintaxis en linea " + look.getLine() + " primera columna " + look.getFirst_columnn() + " ultima columna " + look.getLast_columnn() + " Token esperado: " + token + "\n\n";
        lista_errores.add(message);
    }

    private void print_error(Tokens token, Tokens token2, token_object look) {
        String message = " ";
        message = "Error de sintaxis en linea " + look.getLine() + " primera columna " + look.getFirst_columnn() + " ultima columna " + look.getLast_columnn() + " Token esperados: " + token + "," + token2 + "\n\n";
        lista_errores.add(message);
    }

    private void print_error(Tokens token, Tokens token2, Tokens token3, token_object look) {
        String message = " ";
        message = "Error de sintaxis en linea " + look.getLine() + " primera columna " + look.getFirst_columnn() + " ultima columna " + look.getLast_columnn() + " Token esperados: " + token + "," + token2 + "," + token3 + "\n\n";
        lista_errores.add(message);
    }

    private void print_error(Tokens token, Tokens token2, Tokens token3, Tokens token4, token_object look) {
        String message = " ";
        message = "Error de sintaxis en linea " + look.getLine() + " primera columna " + look.getFirst_columnn() + " ultima columna " + look.getLast_columnn() + " Token esperados: " + token + "," + token2 + "," + token3 + "," + token4 + "\n\n";
        lista_errores.add(message);
    }

    private void print_error(Tokens token, Tokens token2, Tokens token3, Tokens token4, Tokens token5, token_object look) {
        String message = " ";
        message = "Error de sintaxis en linea " + look.getLine() + " primera columna " + look.getFirst_columnn() + " ultima columna " + look.getLast_columnn() + " Token esperados: " + token + "," + token2 + "," + token3 + "," + token4 + "," + token5 + "\n\n";
        lista_errores.add(message);
    }

    private void inicio() {

        if (lookahed.getToken() == Tokens.DROP) {

            drop();
        } else if (lookahed.getToken() == Tokens.SELECT) {
            select();
        } else if (lookahed.getToken() == Tokens.DELETE) {
            delete();
        } else if (lookahed.getToken() == Tokens.CREATE) {
            create();
        } else if (lookahed.getToken() == Tokens.INSERT) {
            insert();
        } else if (lookahed.getToken() == Tokens.ALTER) {
            alter();
        } else if (lookahed.getToken() == Tokens.TRUNCATE) {
            truncate();
        } else if (lookahed.getToken() == Tokens.UPDATE) {
            update();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.final_texto || lookahed.getToken() == null) {
            finalizar();
        } else {
            error(Tokens.SELECT, Tokens.DELETE, Tokens.CREATE, Tokens.INSERT, Tokens.ALTER);
        }
    }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------

    private void drop() {
        if (lookahed.getToken() == Tokens.DROP) {
            match(Tokens.DROP);
            a5();

        } else {
            error(Tokens.DROP);

        }

    }

    private void a5() {
        if ((lookahed.getToken() == Tokens.TABLE)) {
            match(Tokens.TABLE);
            if_op();
            T();

        } else if ((lookahed.getToken() == Tokens.DATABASE)) {
            DB();

        } else if ((lookahed.getToken() == Tokens.INDEX)) {
            IN();
        } else {
            error(Tokens.TABLE, Tokens.DATABASE, Tokens.INDEX);
        }

    }

    private void T() {
        if (lookahed.getToken() == Tokens.Identificador) {
            i1();
            Tprima();
        } else {
            error(Tokens.Identificador);
        }
    }

    private void Tprima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            T();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void DB() {
        if ((lookahed.getToken() == Tokens.DATABASE)) {
            match(Tokens.DATABASE);
            if_op();
            match(Tokens.Identificador);
            DBprima();

        } else {
            error(Tokens.DATABASE);
        }
    }

    private void DBprima() {
        if ((lookahed.getToken() == Tokens.coma)) {
            match(Tokens.coma);
            match(Tokens.Identificador);
            DBprima();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();

        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void if_op() {
        if ((lookahed.getToken() == Tokens.IF)) {

            match(Tokens.IF);
            match(Tokens.EXISTS);

        } else if ((lookahed.getToken() == Tokens.Identificador)) {
            return;
        } else {
            error(Tokens.IF, Tokens.Identificador);
        }
    }

    private void IN() {
        if ((lookahed.getToken() == Tokens.INDEX)) {
            match(Tokens.INDEX);
            if_op();

            INprima();

        } else {
            error(Tokens.INDEX);
        }
    }

    private void INprima() {
        //los dos tokens comienzan por el mismo no se que hacer
        match(Tokens.Identificador);
        if (lookahed.getToken() == Tokens.ON) {
            drop_relational_or_xml_or_spatial_index();

        } else if (lookahed.getToken() == Tokens.punto) {
            drop_backward_compatible_index();
        } else {
            error(Tokens.Identificador, Tokens.punto);
        }

    }

    private void drop_relational_or_xml_or_spatial_index() {
        //los dos tokens comienzan por el mismo no se que hacer
        if (lookahed.getToken() == Tokens.ON) {
            match(Tokens.ON);
            i1();
            drop_relational_or_xml_or_spatial_index_prima();
        } else {
            error(Tokens.ON);
        }

    }

    private void drop_relational_or_xml_or_spatial_index_prima() {
        //los dos tokens comienzan por el mismo no se que hacer
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            INprima();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }

    }

    private void drop_backward_compatible_index() {

        if (lookahed.getToken() == Tokens.punto) {
            i2();
            drop_backward_compatible_index_prima();
        } else {
            error(Tokens.punto);
        }

    }

    private void drop_backward_compatible_index_prima() {
        //los dos tokens comienzan por el mismo no se que hacer
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            INprima();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }

    }

    private void i1() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
            i2();
        } else {
            error(Tokens.Identificador);
        }

    }

    private void i2() {
        if (lookahed.getToken() == Tokens.punto) {
            match(Tokens.punto);
            match(Tokens.Identificador);
            i3();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.coma) {
            return;
        } else {
            error(Tokens.punto, Tokens.punto_coma, Tokens.GO, Tokens.coma);
        }
    }

    private void i3() {
        if (lookahed.getToken() == Tokens.punto) {
            match(Tokens.punto);
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.coma) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.punto, Tokens.punto_coma, Tokens.GO, Tokens.coma);
        }
    }

    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------
    private void truncate() {
        if (lookahed.getToken() == Tokens.TRUNCATE) {
            match(Tokens.TRUNCATE);
            match(Tokens.TABLE);
            ii1();

        } else {
            error(Tokens.TRUNCATE);
        }

    }

    private void ii1() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
            ii2();
        } else {
            error(Tokens.Identificador);
        }

    }

    private void ii2() {
        if (lookahed.getToken() == Tokens.punto) {
            match(Tokens.punto);
            match(Tokens.Identificador);
            ii3();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.punto, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void ii3() {
        if (lookahed.getToken() == Tokens.punto) {
            match(Tokens.punto);
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.punto);
        }
    }

    //-----------------------------------------------------------------------------------------------------------------------
    private void alter() {
        if (lookahed.getToken() == Tokens.ALTER) {
            match(Tokens.ALTER);
            opciones();
        } else {
            error(Tokens.punto);
        }

    }

    private void opciones() {
        if (lookahed.getToken() == Tokens.DATABASE) {
            match(Tokens.DATABASE);
            database();
        } else if (lookahed.getToken() == Tokens.INDEX) {
            match(Tokens.INDEX);
            index();
        } else if (lookahed.getToken() == Tokens.TABLE) {
            match(Tokens.TABLE);
            table();
        } else if (lookahed.getToken() == Tokens.USER) {
            match(Tokens.USER);
            user();
        } else if (lookahed.getToken() == Tokens.VIEW) {
            match(Tokens.VIEW);
            view();
        } else {
            error(Tokens.DATABASE, Tokens.INDEX, Tokens.TABLE, Tokens.USER, Tokens.VIEW);
        }

    }

    private void database() {
        if (lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.CURRENT) {

            nombre_actual();
            tipo_alterbase();
        } else {
            error(Tokens.Identificador, Tokens.CURRENT);
        }

    }

    private void nombre_actual() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.CURRENT) {
            match(Tokens.CURRENT);
        } else {
            error(Tokens.Identificador, Tokens.CURRENT);
        }

    }

    private void tipo_alterbase() {
        if (lookahed.getToken() == Tokens.MODIFY) {
            match(Tokens.MODIFY);
            match(Tokens.NAME);
            match(Tokens.igual);
            match(Tokens.Identificador);
            finalizar();
        } else {
            error(Tokens.MODIFY);
        }

    }

    private void index() {
        if (lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.ALL) {
            nombre_index();
            match(Tokens.ON);
            objeto_nombre();
            accion_index();
        } else {
            error(Tokens.Identificador, Tokens.ALL);
        }

    }

    private void nombre_index() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.ALL) {
            match(Tokens.ALL);

        } else {
            error(Tokens.Identificador, Tokens.ALL);
        }

    }

    private void objeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            objeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void accion_index() {
        if (lookahed.getToken() == Tokens.DISABLE) {
            match(Tokens.DISABLE);
            finalizar();
        } else if (lookahed.getToken() == Tokens.REBUILD) {
            match(Tokens.REBUILD);
            finalizar();

        } else if (lookahed.getToken() == Tokens.UNUSABLE) {
            match(Tokens.UNUSABLE);
            finalizar();

        } else if (lookahed.getToken() == Tokens.USABLE) {
            match(Tokens.USABLE);
            finalizar();

        } else {
            error(Tokens.DISABLE, Tokens.REBUILD, Tokens.UNUSABLE, Tokens.USABLE);
        }

    }

    private void objeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            objeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.DISABLE || lookahed.getToken() == Tokens.REBUILD || lookahed.getToken() == Tokens.USABLE || lookahed.getToken() == Tokens.UNUSABLE || lookahed.getToken() == Tokens.parentesis_derecho) {

            return;
        } else {
            error(Tokens.punto, Tokens.DISABLE, Tokens.REBUILD, Tokens.UNUSABLE, Tokens.USABLE);
        }

    }

    private void objeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.DISABLE || lookahed.getToken() == Tokens.REBUILD | lookahed.getToken() == Tokens.USABLE || lookahed.getToken() == Tokens.UNUSABLE) {
            return;
        } else {
            error(Tokens.punto, Tokens.DISABLE, Tokens.REBUILD, Tokens.UNUSABLE, Tokens.USABLE);
        }
    }

    private void Tobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Tobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Tobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Tobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.ALTER || lookahed.getToken() == Tokens.ADD | lookahed.getToken() == Tokens.DROP) {

            return;
        } else {
            error(Tokens.punto, Tokens.ALTER, Tokens.ADD, Tokens.DROP);
        }

    }

    private void Tobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.ALTER || lookahed.getToken() == Tokens.ADD | lookahed.getToken() == Tokens.DROP) {
            return;
        } else {
            error(Tokens.punto, Tokens.ALTER, Tokens.ADD, Tokens.DROP);
        }
    }

    private void table() {
        if (lookahed.getToken() == Tokens.Identificador) {
            Tobjeto_nombre();
            accionalter();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void accionalter() {
        if (lookahed.getToken() == Tokens.ALTER) {

            match(Tokens.ALTER);
            match(Tokens.COLUMN);
            addcolumn1();

        } else if (lookahed.getToken() == Tokens.ADD) {
            match(Tokens.ADD);
            tipo_add();

        } else if (lookahed.getToken() == Tokens.DROP) {
            match(Tokens.DROP);
            drop_column();

        } else {
            error(Tokens.ALTER, Tokens.ADD, Tokens.DROP);
        }
    }

    private void addcolumn() {
        if (lookahed.getToken() == Tokens.Identificador) {

            addcolumn1();
            addcolumnprima();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void addcolumn1() {
        if (lookahed.getToken() == Tokens.Identificador) {
            tiposobjeto_nombre();
            tipo_dato();
            constrait();
        } else {
            error(Tokens.Identificador);
        }
    }

    private void addcolumnprima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            addcolumn();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }
    }

    //varchar,bit,int,float,real,date,
    private void tipo_dato() {
        if (lookahed.getToken() == Tokens.VARCHAR) {
            match(Tokens.VARCHAR);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.DATE) {
            match(Tokens.DATE);
        } else if (lookahed.getToken() == Tokens.FLOAT) {
            match(Tokens.FLOAT);
        } else if (lookahed.getToken() == Tokens.REAL) {
            match(Tokens.REAL);
        } else if (lookahed.getToken() == Tokens.INT) {
            match(Tokens.INT);
        } else if (lookahed.getToken() == Tokens.BIT) {
            match(Tokens.BIT);
        } else if (lookahed.getToken() == Tokens.NUMERIC) {
            match(Tokens.NUMERIC);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.coma);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.DECIMAL) {
            match(Tokens.DECIMAL);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.coma);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.DATETIME) {
            match(Tokens.DATETIME);
        } else if (lookahed.getToken() == Tokens.CHAR) {
            match(Tokens.CHAR);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);
        } else {
            error(Tokens.VARCHAR, Tokens.DATE, Tokens.FLOAT, Tokens.REAL, Tokens.INT);
        }
    }

    private void constrait() {
        if (lookahed.getToken() == Tokens.NULL) {
            match(Tokens.NULL);

        } else if (lookahed.getToken() == Tokens.NOT) {
            match(Tokens.NOT);
            match(Tokens.NULL);
        } else if (lookahed.getToken() == Tokens.UNIQUE) {
            match(Tokens.UNIQUE);
        } else if (lookahed.getToken() == Tokens.PRIMARY) {
            match(Tokens.PRIMARY);
            match(Tokens.KEY);
        } else if (lookahed.getToken() == Tokens.FOREIGN) {
            match(Tokens.FOREIGN);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            match(Tokens.REFERENCES);
            pdobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.DEFAULT) {
            match(Tokens.DEFAULT);
            datatipo();
        } else if (lookahed.getToken() == Tokens.IDENTITY) {
            match(Tokens.IDENTITY);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.coma);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.coma) {

            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.NULL, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN, Tokens.DEFAULT);
        }
    }

    private void pdobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Aobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Aobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Aobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_derecho);
        }

    }

    private void Aobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_derecho);
        }
    }

    private void tiposobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Bobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Bobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Bobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.VARCHAR || lookahed.getToken() == Tokens.DATE || lookahed.getToken() == Tokens.REAL || lookahed.getToken() == Tokens.FLOAT || lookahed.getToken() == Tokens.BIT || lookahed.getToken() == Tokens.INT || lookahed.getToken() == Tokens.NUMERIC || lookahed.getToken() == Tokens.DECIMAL || lookahed.getToken() == Tokens.CHAR || lookahed.getToken() == Tokens.DATETIME) {
            return;
        } else {
            error(Tokens.punto, Tokens.VARCHAR, Tokens.DATE, Tokens.FLOAT, Tokens.REAL);
        }

    }

    private void Bobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.VARCHAR || lookahed.getToken() == Tokens.DATE || lookahed.getToken() == Tokens.REAL || lookahed.getToken() == Tokens.FLOAT || lookahed.getToken() == Tokens.BIT || lookahed.getToken() == Tokens.INT || lookahed.getToken() == Tokens.NUMERIC || lookahed.getToken() == Tokens.DECIMAL || lookahed.getToken() == Tokens.CHAR || lookahed.getToken() == Tokens.DATETIME) {
            return;
        } else {
            error(Tokens.punto, Tokens.VARCHAR, Tokens.DATE, Tokens.FLOAT, Tokens.REAL);
        }
    }

    private void Cobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Cobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Cobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Cobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.UNIQUE || lookahed.getToken() == Tokens.FOREIGN || lookahed.getToken() == Tokens.PRIMARY || lookahed.getToken() == Tokens.CHECK || lookahed.getToken() == Tokens.NOT) {
            return;
        } else {
            error(Tokens.punto, Tokens.UNIQUE, Tokens.FOREIGN, Tokens.PRIMARY, Tokens.CHECK);
        }

    }

    private void Cobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.UNIQUE || lookahed.getToken() == Tokens.FOREIGN || lookahed.getToken() == Tokens.PRIMARY || lookahed.getToken() == Tokens.CHECK || lookahed.getToken() == Tokens.NOT) {
            return;
        } else {
            error(Tokens.punto, Tokens.UNIQUE, Tokens.FOREIGN, Tokens.PRIMARY, Tokens.CHECK);
        }
    }

    private void tipo_add() {
        if (lookahed.getToken() == Tokens.CONSTRAINT) {

            match(Tokens.CONSTRAINT);
            Cobjeto_nombre();
            tipo_constrait();
        } else if (lookahed.getToken() == Tokens.Identificador) {
            addcolumn();
        } else if (lookahed.getToken() == Tokens.FOREIGN) {
            match(Tokens.FOREIGN);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            match(Tokens.REFERENCES);
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.CHECK) {
            match(Tokens.CHECK);
            match(Tokens.parentesis_izquierdo);
            expresion_logica();
            match(Tokens.parentesis_derecho);

        } else {
            error(Tokens.CONSTRAINT, Tokens.Identificador, Tokens.FOREIGN, Tokens.CHECK);
        }

    }

    private void drop_column() {
        if (lookahed.getToken() == Tokens.CONSTRAINT) {

            match(Tokens.CONSTRAINT);
            ii1();

        } else if (lookahed.getToken() == Tokens.COLUMN) {
            match(Tokens.COLUMN);
            ii1();
        } else {
            error(Tokens.CONSTRAINT, Tokens.COLUMN);
        }
    }

    private void datatipo() {
        if (lookahed.getToken() == Tokens.String) {

            match(Tokens.String);

        } else if (lookahed.getToken() == Tokens.Bool) {

            match(Tokens.Bool);

        } else if (lookahed.getToken() == Tokens.Int) {

            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.Float) {

            match(Tokens.Float);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float);
        }
    }

    private void tipo_constrait() {
        if (lookahed.getToken() == Tokens.CHECK) {
            match(Tokens.CHECK);
            match(Tokens.parentesis_izquierdo);
            expresion_logica();
            match(Tokens.parentesis_derecho);
            finalizar();
        } else if (lookahed.getToken() == Tokens.UNIQUE) {
            match(Tokens.UNIQUE);
            match(Tokens.parentesis_izquierdo);
            id_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);
            finalizar();
        } else if (lookahed.getToken() == Tokens.PRIMARY) {
            match(Tokens.PRIMARY);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            tiposobjeto_nombre();
            match(Tokens.parentesis_derecho);
            finalizar();
        } else if (lookahed.getToken() == Tokens.FOREIGN) {
            match(Tokens.FOREIGN);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            match(Tokens.REFERENCES);
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            finalizar();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.CHECK, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN, Tokens.punto_coma);
        }
    }

    private void id_por_comas_entre_parentesis() {
        if ((lookahed.getToken() == Tokens.Identificador)) {
            match(Tokens.Identificador);
            id_por_comas_entre_parentesisprima();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void id_por_comas_entre_parentesisprima() {
        if ((lookahed.getToken() == Tokens.coma)) {
            match(Tokens.coma);
            match(Tokens.Identificador);
            id_por_comas_entre_parentesisprima();

        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;

        } else {
            error(Tokens.coma, Tokens.parentesis_derecho);
        }
    }

    private void expresion_logica() {
        if (lookahed.getToken() == Tokens.Identificador) {
            expresion_logica1();
            expresion_logicaprima();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void expresion_logica1() {
        if (lookahed.getToken() == Tokens.Identificador) {
            constraint_objeto_nombre();
            operadores();
            datatipo();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void expresion_logicaprima() {
        if (lookahed.getToken() == Tokens.AND || lookahed.getToken() == Tokens.OR || lookahed.getToken() == Tokens.or || lookahed.getToken() == Tokens.and) {
            operadoreslogicos();
            expresion_logica();

        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.AND, Tokens.OR, Tokens.parentesis_derecho);
        }
    }

    private void constraint_objeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Dobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Dobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Dobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE || lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.BETWEEN || lookahed.getToken() == Tokens.IS || lookahed.getToken() == Tokens.igual) {
            return;
        } else {
            error(Tokens.punto, Tokens.mayor, Tokens.comparar, Tokens.menor, Tokens.diferente);
        }

    }

    private void Dobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE || lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.BETWEEN || lookahed.getToken() == Tokens.IS || lookahed.getToken() == Tokens.igual) {
            return;
        } else {
            error(Tokens.punto, Tokens.mayor, Tokens.comparar, Tokens.menor, Tokens.diferente);
        }
    }

    private void operadores() {
        if (lookahed.getToken() == Tokens.mayor) {

            match(Tokens.mayor);

        } else if (lookahed.getToken() == Tokens.menor) {

            match(Tokens.menor);

        } else if (lookahed.getToken() == Tokens.mayor_igual) {

            match(Tokens.mayor_igual);

        } else if (lookahed.getToken() == Tokens.menor_igual) {

            match(Tokens.menor_igual);

        } else if (lookahed.getToken() == Tokens.diferente) {
            match(Tokens.diferente);

        } else if (lookahed.getToken() == Tokens.comparar) {
            match(Tokens.comparar);

        } else if (lookahed.getToken() == Tokens.LIKE) {
            match(Tokens.LIKE);
        } else if (lookahed.getToken() == Tokens.igual) {
            match(Tokens.igual);
        } else {
            error(Tokens.LIKE, Tokens.mayor, Tokens.comparar, Tokens.menor, Tokens.diferente);
        }
    }

    private void operadoreslogicos() {
        if (lookahed.getToken() == Tokens.AND) {

            match(Tokens.AND);

        } else if (lookahed.getToken() == Tokens.OR) {

            match(Tokens.OR);

        } else if (lookahed.getToken() == Tokens.and) {

            match(Tokens.and);

        } else if (lookahed.getToken() == Tokens.or) {

            match(Tokens.or);

        } else {
            error(Tokens.AND, Tokens.OR);
        }
    }

    private void user() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);

            match(Tokens.WITH);
            setitem();
        } else {
            error(Tokens.Identificador);
        }
    }

    private void idobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Eobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Eobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.AS) {
            return;
        } else {
            error(Tokens.punto, Tokens.Identificador);
        }

    }

    private void view() {

        if (lookahed.getToken() == Tokens.Identificador) {
            idobjeto_nombre();
            column_view();
            match(Tokens.AS);

            if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
                match(Tokens.parentesis_izquierdo);
                select();
                match(Tokens.parentesis_derecho);
            } else if (lookahed.getToken() == Tokens.SELECT) {
                select();

            }

        } else {
            error(Tokens.Identificador);
        }
    }

    private void setitem() {
        if (lookahed.getToken() == Tokens.NAME) {
            setitem1();
            setitemprima();
        } else {
            error(Tokens.NAME);
        }
    }

    private void setitem1() {
        if (lookahed.getToken() == Tokens.NAME) {
            match(Tokens.NAME);
            match(Tokens.igual);
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.NULL) {
            match(Tokens.NULL);
        } else if (lookahed.getToken() == Tokens.LOGIN) {
            match(Tokens.LOGIN);
            match(Tokens.igual);
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.PASSWORD) {
            match(Tokens.PASSWORD);
            match(Tokens.igual);
            match(Tokens.String);
        } else {
            error(Tokens.NAME, Tokens.NULL, Tokens.LOGIN, Tokens.PASSWORD);
        }
    }

    private void setitemprima() {
        if (lookahed.getToken() == Tokens.coma) {
            setitem();
            setitemprima();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void column_view() {
        if (lookahed.getToken() == Tokens.Identificador) {
            column_view1();
            column_viewprima();
        } else if (lookahed.getToken() == Tokens.AS) {
            return;

        } else {
            error(Tokens.Identificador, Tokens.AS);
        }
    }

    private void column_viewprima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            column_view();
        } else if (lookahed.getToken() == Tokens.AS) {
            return;

        } else {
            error(Tokens.coma, Tokens.AS);
        }
    }

    private void column_view1() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.AS) {
            return;

        } else {
            error(Tokens.Identificador);
        }
    }

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    private void create() {
        if (lookahed.getToken() == Tokens.CREATE) {
            match(Tokens.CREATE);
            opciones_crear();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void opciones_crear() {
        if (lookahed.getToken() == Tokens.DATABASE) {
            match(Tokens.DATABASE);
            match(Tokens.Identificador);
            finalizar();
        } else if (lookahed.getToken() == Tokens.INDEX || lookahed.getToken() == Tokens.CLUSTERED || lookahed.getToken() == Tokens.NONCLUSTERED || lookahed.getToken() == Tokens.UNIQUE) {
            opciones_index();
            match(Tokens.INDEX);
            index_create();
        } else if (lookahed.getToken() == Tokens.TABLE) {
            match(Tokens.TABLE);
            table_create();
        } else if (lookahed.getToken() == Tokens.USER) {
            match(Tokens.USER);
            user_create();
        } else if (lookahed.getToken() == Tokens.VIEW) {
            match(Tokens.VIEW);
            view();
        } else {
            error(Tokens.DATABASE, Tokens.CLUSTERED, Tokens.TABLE, Tokens.USER, Tokens.VIEW);
        }
    }

    private void opciones_index() {
        if (lookahed.getToken() == Tokens.UNIQUE) {
            match(Tokens.UNIQUE);

        } else if (lookahed.getToken() == Tokens.CLUSTERED) {
            match(Tokens.CLUSTERED);

        } else if (lookahed.getToken() == Tokens.NONCLUSTERED) {
            match(Tokens.NONCLUSTERED);

        } else if (lookahed.getToken() == Tokens.INDEX) {
            return;
        } else {
            error(Tokens.UNIQUE, Tokens.CLUSTERED, Tokens.NONCLUSTERED);
        }
    }

    private void Iobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            Iobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void Iobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            Iobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.VALUES) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }

    }

    private void Iobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.VALUES) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }
    }

    private void index_create() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            match(Tokens.ON);
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            id_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);
            mas_index();
        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
            return;
        } else {

            error(Tokens.Identificador, Tokens.parentesis_izquierdo);
        }
    }

    private void mas_index() {
        if (lookahed.getToken() == Tokens.INCLUDE) {

            match(Tokens.INCLUDE);
            match(Tokens.parentesis_izquierdo);
            id_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);
            mas_index();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {

            error(Tokens.Identificador, Tokens.parentesis_izquierdo);
        }
    }

    private void table_create() {
        if (lookahed.getToken() == Tokens.Identificador) {
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            tipo_add_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);
            finalizar();
        } else {

            error(Tokens.Identificador, Tokens.parentesis_izquierdo);
        }
    }

    private void tipo_add_por_comas_entre_parentesis() {
        if ((lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.CONSTRAINT || lookahed.getToken() == Tokens.FOREIGN || lookahed.getToken() == Tokens.CHECK || lookahed.getToken() == Tokens.PRIMARY)) {
            tipo_addA();
            tipo_add_por_comas_entre_parentesisprima();

        } else {
            error(Tokens.Identificador, Tokens.CONSTRAINT, Tokens.FOREIGN, Tokens.CHECK);
        }
    }

    private void tipo_add_por_comas_entre_parentesisprima() {
        if ((lookahed.getToken() == Tokens.coma)) {
            match(Tokens.coma);
            tipo_addA();
            tipo_add_por_comas_entre_parentesisprima();

        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;

        } else {
            error(Tokens.coma, Tokens.parentesis_derecho);
        }
    }

    private void tipo_addA() {
        if (lookahed.getToken() == Tokens.CONSTRAINT) {

            match(Tokens.CONSTRAINT);
            Cobjeto_nombre();
            tipo_constraitA();
        } else if (lookahed.getToken() == Tokens.Identificador) {
            addcolumn1A();
        } else if (lookahed.getToken() == Tokens.FOREIGN) {
            match(Tokens.FOREIGN);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            match(Tokens.REFERENCES);
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.CHECK) {
            match(Tokens.CHECK);
            match(Tokens.parentesis_izquierdo);
            expresion_logica();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.PRIMARY) {
            match(Tokens.PRIMARY);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            id_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);

        } else {
            error(Tokens.CONSTRAINT, Tokens.Identificador, Tokens.FOREIGN, Tokens.CHECK);
        }

    }

    private void addcolumn1A() {
        if (lookahed.getToken() == Tokens.Identificador) {
            tiposobjeto_nombre();
            tipo_dato();
            constrait1();
        } else {
            error(Tokens.Identificador);
        }
    }

    private void user_create() {
        if ((lookahed.getToken() == Tokens.Identificador)) {
            match(Tokens.Identificador);
            match(Tokens.FOR);
            match(Tokens.LOGIN);
            match(Tokens.Identificador);
            finalizar();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void constrait1() {
        if (lookahed.getToken() == Tokens.NULL || lookahed.getToken() == Tokens.NOT || lookahed.getToken() == Tokens.UNIQUE || lookahed.getToken() == Tokens.PRIMARY || lookahed.getToken() == Tokens.FOREIGN || lookahed.getToken() == Tokens.CHECK || lookahed.getToken() == Tokens.DEFAULT || lookahed.getToken() == Tokens.IDENTITY) {
            constrait();
            constraitprima();

        } else if (lookahed.getToken() == Tokens.coma) {

        } else {
            error(Tokens.NULL, Tokens.NOT, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN);
        }
    }

    private void constraitprima() {
        if (lookahed.getToken() == Tokens.NULL || lookahed.getToken() == Tokens.NOT || lookahed.getToken() == Tokens.UNIQUE || lookahed.getToken() == Tokens.PRIMARY || lookahed.getToken() == Tokens.FOREIGN || lookahed.getToken() == Tokens.CHECK || lookahed.getToken() == Tokens.DEFAULT || lookahed.getToken() == Tokens.IDENTITY) {
            constrait();
            constrait1();

        } else if (lookahed.getToken() == Tokens.coma) {
            return;
        } else {
            error(Tokens.NULL, Tokens.NOT, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN);
        }
    }

    private void tipo_constraitA() {
        if (lookahed.getToken() == Tokens.CHECK) {
            match(Tokens.CHECK);
            match(Tokens.parentesis_izquierdo);
            expresion_logica();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.UNIQUE) {
            match(Tokens.UNIQUE);
            match(Tokens.parentesis_izquierdo);
            id_por_comas_entre_parentesis();
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.PRIMARY) {
            match(Tokens.PRIMARY);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Identificador);
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.FOREIGN) {
            match(Tokens.FOREIGN);
            match(Tokens.KEY);
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);
            match(Tokens.REFERENCES);
            Iobjeto_nombre();
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Identificador);
            match(Tokens.parentesis_derecho);
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.CHECK, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN, Tokens.punto_coma);
        }
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------------
    private void select() {
        if (lookahed.getToken() == Tokens.SELECT) {
            match(Tokens.SELECT);
            opcion_select();
            match(Tokens.FROM);
            origen();
            join();
            condicionales();
            agrupado();
            teniendo();
            orden();

        } else {
            error(Tokens.CHECK, Tokens.UNIQUE, Tokens.PRIMARY, Tokens.FOREIGN, Tokens.punto_coma);
        }

    }

    ;

    private void opcion_select() {
        if (lookahed.getToken() == Tokens.TOP) {
            match(Tokens.TOP);
            e();
            columna();
        } else if (lookahed.getToken() == Tokens.DISTINCT) {
            match(Tokens.DISTINCT);

            columna();

        } else if (lookahed.getToken() == Tokens.ALL) {
            match(Tokens.ALL);

            columna();

        } else if (lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.SUM || lookahed.getToken() == Tokens.AVG || lookahed.getToken() == Tokens.COUNT || lookahed.getToken() == Tokens.MAX || lookahed.getToken() == Tokens.MIN || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            columna();
        } else {
            error(Tokens.TOP, Tokens.Bool, Tokens.String, Tokens.Bool, Tokens.Identificador);
        }
    }

    private void e() {
        if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
            match(Tokens.parentesis_izquierdo);
            match(Tokens.Int);
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.Int) {
            match(Tokens.Int);
        } else {
            error(Tokens.parentesis_izquierdo, Tokens.Int);
        }
    }

    private void columna() {
        if (lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.SUM || lookahed.getToken() == Tokens.AVG || lookahed.getToken() == Tokens.COUNT || lookahed.getToken() == Tokens.MAX || lookahed.getToken() == Tokens.MIN || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            columna1();
            alias_columna();
            columnaprima();
        } else {
            error(Tokens.TOP, Tokens.Bool, Tokens.String, Tokens.Bool, Tokens.Identificador);
        }
    }

    private void columna1() {
        if (lookahed.getToken() == Tokens.parentesis_izquierdo) {

            match(Tokens.parentesis_izquierdo);
            datatipo_select();
            columnafact();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.Identificador) {

            datatipo_select();
            columna1prima();

        } else if (lookahed.getToken() == Tokens.SUM || lookahed.getToken() == Tokens.AVG || lookahed.getToken() == Tokens.COUNT || lookahed.getToken() == Tokens.MAX || lookahed.getToken() == Tokens.MIN) {

            funciones();
        } else if (lookahed.getToken() == Tokens.multiplicacion) {
            match(Tokens.multiplicacion);
        } else {
            error(Tokens.String, Tokens.SUM, Tokens.AVG, Tokens.COUNT, Tokens.Int);
        }
    }

    private void columna1prima() {
        if (lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE) {
            columnafact();

        } else if (lookahed.getToken() == Tokens.igual) {

            match(Tokens.igual);

            if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
                match(Tokens.parentesis_izquierdo);
                datatipo_select();
                columnafact();
                match(Tokens.parentesis_derecho);
            } else {
                datatipo_select();
                columnafact();
            }

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.FROM || lookahed.getToken() == Tokens.AS) {
            return;
        } else {
            error(Tokens.String, Tokens.SUM, Tokens.AVG, Tokens.COUNT, Tokens.Int);
        }
    }

    private void columnafact() {
        if (lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE) {
            operaciones();

        } else if (lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.FROM) {
            return;
        } else {
            error(Tokens.multiplicacion, Tokens.division, Tokens.resta, Tokens.AND, Tokens.OR);
        }
    }

    private void datatipo_select() {
        if (lookahed.getToken() == Tokens.String) {

            match(Tokens.String);

        } else if (lookahed.getToken() == Tokens.Bool) {

            match(Tokens.Bool);

        } else if (lookahed.getToken() == Tokens.Int) {

            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.Float) {

            match(Tokens.Float);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            comaobjeto_nombre();
        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float);
        }
    }

    private void datatipo_selectwhere() {
        if (lookahed.getToken() == Tokens.String) {

            match(Tokens.String);

        } else if (lookahed.getToken() == Tokens.Bool) {

            match(Tokens.Bool);

        } else if (lookahed.getToken() == Tokens.Int) {

            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.Float) {

            match(Tokens.Float);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            opobjeto_nombre();
        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float);
        }
    }

    private void comaobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            comaobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void comaobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            comaobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.FROM || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.punto, Tokens.coma);
        }

    }

    private void comaobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.FROM || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.parentesis_derecho) {

            return;

        } else {
            error(Tokens.punto, Tokens.coma);
        }
    }

    private void alias_columna() {

        if (lookahed.getToken() == Tokens.AS) {

            match(Tokens.AS);

            opcion_alias();

        } else if (lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.String) {
            opcion_alias();

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.FROM) {
            return;
        } else {
            error(Tokens.AS, Tokens.FROM);
        }
    }

    private void columnaprima() {
        if (lookahed.getToken() == Tokens.coma) {

            match(Tokens.coma);
            columna();

        } else if (lookahed.getToken() == Tokens.FROM || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.coma) {
            return;
        } else {
            error(Tokens.coma, Tokens.FROM);
        }
    }

    private void funciones() {
        if (lookahed.getToken() == Tokens.SUM) {

            match(Tokens.SUM);
            match(Tokens.parentesis_izquierdo);
            valor();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.AVG) {

            match(Tokens.AVG);
            match(Tokens.parentesis_izquierdo);
            valor();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.COUNT) {

            match(Tokens.COUNT);
            match(Tokens.parentesis_izquierdo);
            valor();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.MIN) {

            match(Tokens.MIN);
            match(Tokens.parentesis_izquierdo);
            valor();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.MAX) {
            match(Tokens.MAX);
            match(Tokens.parentesis_izquierdo);
            valor();
            match(Tokens.parentesis_derecho);

        } else {
            error(Tokens.SUM, Tokens.AVG, Tokens.COUNT, Tokens.MIN, Tokens.MAX);
        }
    }

    private void operaciones() {
        if (lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.resta) {
            operaciones_matematicas();

        } else if (lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE) {
            operadoreslogicas();
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }
    }

    private void operadoreslogicas() {
        if (lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE) {
            operadoreslogicos();
            datatipo_select();
        } else if (lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.comparar || lookahed.getToken() == Tokens.LIKE) {
            operadoreslogicas();
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }
    }

    private void operaciones_matematicas() {
        if (lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.resta) {
            operadoresmat();
            datatipo_select();
            operaciones_matematicasprima();
        } else {
            error(Tokens.suma, Tokens.multiplicacion, Tokens.division, Tokens.resta);
        }
    }

    private void operaciones_matematicasprima() {
        if (lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.resta) {
            operadoresmat();
            columna1();
        } else if (lookahed.getToken() == Tokens.parentesis_derecho || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.FROM) {
            return;

        } else {
            error(Tokens.suma, Tokens.multiplicacion, Tokens.division, Tokens.resta);
        }
    }

    private void operadoresmat() {
        if (lookahed.getToken() == Tokens.suma) {

            match(Tokens.suma);

        } else if (lookahed.getToken() == Tokens.resta) {

            match(Tokens.resta);

        } else if (lookahed.getToken() == Tokens.multiplicacion) {

            match(Tokens.multiplicacion);

        } else if (lookahed.getToken() == Tokens.division) {

            match(Tokens.division);

        } else {
            error(Tokens.suma, Tokens.resta, Tokens.multiplicacion, Tokens.division);
        }
    }

    private void valor() {
        if (lookahed.getToken() == Tokens.multiplicacion) {

            match(Tokens.multiplicacion);

        } else if (lookahed.getToken() == Tokens.Int) {

            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.DISTINCT || lookahed.getToken() == Tokens.ALL) {
            puede();

        } else if (lookahed.getToken() == Tokens.Identificador) {
            pdobjeto_nombre();
        } else {
            error(Tokens.suma, Tokens.Int, Tokens.DISTINCT, Tokens.ALL);
        }
    }

    private void puede() {

        if (lookahed.getToken() == Tokens.DISTINCT) {

            match(Tokens.DISTINCT);
            puedeprima();

        } else if (lookahed.getToken() == Tokens.ALL) {
            match(Tokens.ALL);
            puedeprima();

        } else {
            error(Tokens.DISTINCT, Tokens.ALL);
        }
    }

    private void puedeprima() {
        if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
            match(Tokens.parentesis_izquierdo);
            pdobjeto_nombre();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.Identificador) {

            objeto_nombre();

        } else {
            error(Tokens.parentesis_izquierdo, Tokens.Identificador);
        }
    }

    private void origen() {

        if (lookahed.getToken() == Tokens.Identificador) {
            acwobjeto_nombre();
            alias_tabla();
            origenprima();

        } else if (lookahed.getToken() == Tokens.Identificador) {

            objeto_nombre();

        } else {
            error(Tokens.parentesis_izquierdo, Tokens.Identificador);
        }
    }

    private void acwobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            acwobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void acwobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            acwobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.ON || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.Identificador) {
            return;
        } else {
            error(Tokens.punto, Tokens.ON);
        }

    }

    private void acwobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.ON) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.ON || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.AS || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.Identificador) {
            return;
        } else {
            error(Tokens.punto, Tokens.ON);
        }
    }

    private void alias_tabla() {

        if (lookahed.getToken() == Tokens.AS) {

            match(Tokens.AS);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.ON || lookahed.getToken() == Tokens.JOIN) {
            return;
        } else {
            error(Tokens.AS, Tokens.coma);
        }
    }

    private void origenprima() {
        if (lookahed.getToken() == Tokens.coma) {

            match(Tokens.coma);
            origen();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.JOIN) {

            return;

        } else {
            error(Tokens.coma, Tokens.WHERE);
        }
    }

    private void opcion_alias() {
        if (lookahed.getToken() == Tokens.String) {

            match(Tokens.String);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
        } else {
            error(Tokens.String, Tokens.Identificador);
        }
    }

    private void condicionales() {

        if (lookahed.getToken() == Tokens.WHERE) {

            match(Tokens.WHERE);
            constraint_objeto_nombre();
            operadoress();

        } else if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
        } else if (lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.WHERE, Tokens.Identificador);
        }
    }

    private void operadoress() {
        if (lookahed.getToken() == Tokens.menor) {

            match(Tokens.menor);
            datatipo_selectwhere();
            condicionales1();

        } else if (lookahed.getToken() == Tokens.mayor) {
            match(Tokens.mayor);
            datatipo_selectwhere();
            condicionales1();
        } else if (lookahed.getToken() == Tokens.mayor_igual) {
            match(Tokens.mayor_igual);
            datatipo_selectwhere();
            condicionales1();
        } else if (lookahed.getToken() == Tokens.menor_igual) {
            match(Tokens.menor_igual);
            datatipo_selectwhere();
            condicionales1();
        } else if (lookahed.getToken() == Tokens.diferente) {
            match(Tokens.diferente);
            datatipo_selectwhere();
            condicionales1();
        } else if (lookahed.getToken() == Tokens.comparar) {
            match(Tokens.menor);
            datatipo_selectwhere();
            condicionales1();
        } else if (lookahed.getToken() == Tokens.LIKE) {
            match(Tokens.LIKE);
            match(Tokens.String);
            condicionales1();
        } else if (lookahed.getToken() == Tokens.BETWEEN) {
            match(Tokens.BETWEEN);
            datatipo_selectwhere();
            match(Tokens.AND);
            datatipo_selectwhere();

            condicionales1();
        } else if (lookahed.getToken() == Tokens.IS) {
            match(Tokens.IS);
            if (lookahed.getToken() == Tokens.NOT) {
                match(Tokens.NOT);
                match(Tokens.NULL);

            } else if (lookahed.getToken() == Tokens.NULL) {
                match(Tokens.NULL);

            }

            condicionales1();
        } else if (lookahed.getToken() == Tokens.igual) {
            match(Tokens.igual);
            datatipo_selectwhere();
            condicionales1();
        } else {
            error(Tokens.BETWEEN, Tokens.LIKE, Tokens.comparar, Tokens.diferente, Tokens.mayor);
        }
    }

    private void condicionales1() {
        if (lookahed.getToken() == Tokens.AND || lookahed.getToken() == Tokens.or || lookahed.getToken() == Tokens.OR || lookahed.getToken() == Tokens.and) {

            operadoreslogicos();
            otra_condicion();

        } else if (lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.BETWEEN, Tokens.LIKE, Tokens.comparar, Tokens.diferente, Tokens.mayor);
        }

    }

    private void otra_condicion() {
        if (lookahed.getToken() == Tokens.Identificador) {
            opobjeto_nombre();
            operadoress();

        } else if (lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.BETWEEN, Tokens.LIKE, Tokens.comparar, Tokens.diferente, Tokens.mayor);
        }
    }

    private void opobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            opobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void opobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            opobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.and || lookahed.getToken() == Tokens.AND || lookahed.getToken() == Tokens.or || lookahed.getToken() == Tokens.OR || lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.LIKE || lookahed.getToken() == Tokens.BETWEEN) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }

    }

    private void opobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.and || lookahed.getToken() == Tokens.AND || lookahed.getToken() == Tokens.or || lookahed.getToken() == Tokens.OR || lookahed.getToken() == Tokens.mayor || lookahed.getToken() == Tokens.menor || lookahed.getToken() == Tokens.mayor_igual || lookahed.getToken() == Tokens.igual || lookahed.getToken() == Tokens.menor_igual || lookahed.getToken() == Tokens.diferente || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.LIKE || lookahed.getToken() == Tokens.BETWEEN) {
            return;
        } else {
            error(Tokens.punto, Tokens.and, Tokens.AND, Tokens.or, Tokens.OR);
        }
    }

    private void hobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            hobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void hobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            hobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.punto, Tokens.parentesis_izquierdo);
        }

    }

    private void hobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.GROUP | lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.GROUP, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void agrupado() {
        if (lookahed.getToken() == Tokens.GROUP) {

            match(Tokens.GROUP);
            match(Tokens.BY);
            hobjeto_nombre();
            agrupadoprima();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.GROUP, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void agrupadoprima() {
        if (lookahed.getToken() == Tokens.coma) {

            match(Tokens.coma);
            hobjeto_nombre();
            agrupadoprima();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();

        } else if (lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.GROUP, Tokens.punto_coma, Tokens.GO);
        }
    }

    private void teniendo() {
        if (lookahed.getToken() == Tokens.HAVING) {

            match(Tokens.HAVING);
            teniendo1();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.HAVING, Tokens.ORDER, Tokens.punto_coma);
        }

    }

    private void teniendo1() {
        if (lookahed.getToken() == Tokens.AVG || lookahed.getToken() == Tokens.SUM || lookahed.getToken() == Tokens.MIN || lookahed.getToken() == Tokens.MAX || lookahed.getToken() == Tokens.COUNT) {

            funciones();
            operadores();
            datatipo_selectwhere();
            teniendo2();

        } else if (lookahed.getToken() == Tokens.Identificador) {

            opobjeto_nombre();
            operadores();
            datatipo_selectwhere();
            teniendo2();
        } else {
            error(Tokens.SUM, Tokens.MIN, Tokens.MAX, Tokens.AVG);
        }
    }

    private void teniendo2() {
        if (lookahed.getToken() == Tokens.AND || lookahed.getToken() == Tokens.and || lookahed.getToken() == Tokens.OR || lookahed.getToken() == Tokens.or) {

            operadoreslogicos();
            teniendo1();

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.ORDER) {
            return;
        } else {
            error(Tokens.and, Tokens.ORDER, Tokens.GO);
        }
    }

    private void orden() {
        if (lookahed.getToken() == Tokens.ORDER) {

            match(Tokens.ORDER);
            match(Tokens.BY);

            if (lookahed.getToken() == Tokens.Identificador) {
                comaobjeto_nombre();
                ordenprima();
                tipo_orden();
            } else {

                funciones();
                ordenprima();
                tipo_orden();
            }

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            return;
        } else {
            error(Tokens.and, Tokens.ORDER, Tokens.GO);
        }

    }

    private void tipo_orden() {
        if (lookahed.getToken() == Tokens.ASC) {

            match(Tokens.ASC);

        } else if (lookahed.getToken() == Tokens.DESC) {
            match(Tokens.DESC);

        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.and, Tokens.ORDER, Tokens.GO);
        }

    }

    private void ordenprima() {
        if (lookahed.getToken() == Tokens.coma) {

            match(Tokens.coma);

            comaobjeto_nombre();
            ordenprima();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else if (lookahed.getToken() == Tokens.DESC || lookahed.getToken() == Tokens.ASC) {
            return;
        } else {
            error(Tokens.coma, Tokens.punto_coma, Tokens.GO);
        }

    }

    private void join() {
        if (lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT) {

            tipo_join();
            match(Tokens.JOIN);
            acwobjeto_nombre();
            alias_tabla();
            match(Tokens.ON);
            igobjeto_nombre();
            match(Tokens.igual);
            joobjeto_nombre();
            joinprima();
        } else if (lookahed.getToken() == Tokens.JOIN) {
            match(Tokens.JOIN);
            acwobjeto_nombre();
            alias_tabla();
            match(Tokens.ON);
            igobjeto_nombre();
            match(Tokens.igual);
            joobjeto_nombre();
            joinprima();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.HAVING) {
            return;
        } else {
            error(Tokens.INNER, Tokens.FULL, Tokens.punto_coma, Tokens.WHERE, Tokens.ORDER);
        }

    }

    private void igobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            igobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void igobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            igobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.igual) {
            return;
        } else {
            error(Tokens.punto, Tokens.igual);
        }

    }

    private void igobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.igual) {
            return;
        } else {
            error(Tokens.punto, Tokens.igual);
        }
    }

    private void joobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            jogobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void jogobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            joobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.JOIN || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            return;
        } else {
            error(Tokens.punto, Tokens.INNER, Tokens.FULL);
        }

    }

    private void joobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.JOIN || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            return;
        } else {
            error(Tokens.punto, Tokens.INNER, Tokens.FULL);
        }
    }

    private void joinprima() {
        if (lookahed.getToken() == Tokens.INNER || lookahed.getToken() == Tokens.FULL || lookahed.getToken() == Tokens.LEFT || lookahed.getToken() == Tokens.RIGHT || lookahed.getToken() == Tokens.JOIN) {
            join();

        } else if (lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.HAVING) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.punto, Tokens.INNER, Tokens.FULL, Tokens.JOIN, Tokens.WHERE);
        }
    }

    private void tipo_join() {
        if (lookahed.getToken() == Tokens.INNER) {
            match(Tokens.INNER);

        } else if (lookahed.getToken() == Tokens.FULL) {
            match(Tokens.FULL);
            tipo_join1();
        } else if (lookahed.getToken() == Tokens.LEFT) {
            match(Tokens.LEFT);
            tipo_join1();

        } else if (lookahed.getToken() == Tokens.RIGHT) {
            match(Tokens.RIGHT);
            tipo_join1();

        } else {
            error(Tokens.punto, Tokens.INNER, Tokens.FULL);
        }

    }

    private void tipo_join1() {
        if (lookahed.getToken() == Tokens.OUTER) {
            match(Tokens.OUTER);

        } else if (lookahed.getToken() == Tokens.JOIN) {
            return;

        } else {
            error(Tokens.OUTER, Tokens.RIGHT);
        }

    }

    //--------------------------------------------------------------------------------
    private void update() {
        if (lookahed.getToken() == Tokens.UPDATE) {
            match(Tokens.UPDATE);
            opciones_update();
            objeto_nombreset();
            match(Tokens.SET);
            igobjeto_nombre();
            match(Tokens.igual);
            asignaciones();
            condicionales();

        } else if (lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.GROUP || lookahed.getToken() == Tokens.ORDER || lookahed.getToken() == Tokens.HAVING || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.JOIN) {
            return;

        } else {
            error(Tokens.OUTER, Tokens.RIGHT);
        }

    }

    private void objeto_nombreset() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            objeto_nombresetprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void objeto_nombresetprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            objeto_nombreset1prima();
        } else if (lookahed.getToken() == Tokens.SET) {
            return;
        } else {
            error(Tokens.punto, Tokens.SET);
        }

    }

    private void objeto_nombreset1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.SET) {
            return;
        } else {
            error(Tokens.punto, Tokens.SET);
        }

    }

    private void opciones_update() {
        if (lookahed.getToken() == Tokens.TOP) {
            match(Tokens.TOP);
            e();
            percent();

        } else if (lookahed.getToken() == Tokens.Identificador) {
            return;
        } else {
            error(Tokens.TOP, Tokens.Identificador);
        }
    }

    private void percent() {
        if (lookahed.getToken() == Tokens.PERCENT) {
            match(Tokens.PERCENT);

        } else if (lookahed.getToken() == Tokens.Identificador) {

            return;
        } else {
            error(Tokens.PERCENT, Tokens.Identificador);

        }
    }

    private void asignaciones() {
        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            asignaciones1();
            asignacionesprima();

        } else {
            error(Tokens.Identificador);

        }

    }

    private void cwobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            cwobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void cwobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            cwobjeto_nombre1prima();
        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.punto, Tokens.coma, Tokens.punto_coma, Tokens.GO, Tokens.WHERE);
        }

    }

    private void cwobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.multiplicacion || lookahed.getToken() == Tokens.division || lookahed.getToken() == Tokens.suma || lookahed.getToken() == Tokens.resta || lookahed.getToken() == Tokens.parentesis_izquierdo || lookahed.getToken() == Tokens.parentesis_derecho) {

            return;

        } else {
            error(Tokens.punto, Tokens.coma, Tokens.punto_coma, Tokens.GO, Tokens.WHERE);
        }
    }

    private void asignaciones1() {
        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            ee();

        } else {
            error(Tokens.String, Tokens.Int, Tokens.Identificador, Tokens.Bool, Tokens.Float);
        }
    }

    private void datatipoupdate() {
        if (lookahed.getToken() == Tokens.String) {

            match(Tokens.String);

        } else if (lookahed.getToken() == Tokens.Bool) {

            match(Tokens.Bool);

        } else if (lookahed.getToken() == Tokens.Int) {

            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.Float) {

            match(Tokens.Float);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            cwobjeto_nombre();
        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float);
        }

    }

    private void ee() {
        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.Float) {
            datatipoupdate();
            v();

        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo) {

            match(Tokens.parentesis_izquierdo);
            ee();
            c();
            v();

        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float, Tokens.parentesis_izquierdo);
        }

    }

    private void v() {

        if (lookahed.getToken() == Tokens.multiplicacion) {
            match(Tokens.multiplicacion);
            t();
            x();

        } else if (lookahed.getToken() == Tokens.division) {

            match(Tokens.division);
            t();
            x();
        } else if (lookahed.getToken() == Tokens.suma) {
            match(Tokens.suma);
            ee();
        } else if (lookahed.getToken() == Tokens.resta) {
            match(Tokens.resta);
            ee();
        } else if (lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.parentesis_derecho || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.suma, Tokens.resta, Tokens.WHERE, Tokens.Float, Tokens.GO);
        }
    }

    private void x() {
        if (lookahed.getToken() == Tokens.suma) {
            match(Tokens.suma);
            ee();
        } else if (lookahed.getToken() == Tokens.resta) {
            match(Tokens.resta);
            ee();
        } else if (lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.parentesis_derecho || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.suma, Tokens.resta, Tokens.WHERE, Tokens.Float, Tokens.GO);
        }
    }

    private void t() {
        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.Float) {
            datatipoupdate();
            u();

        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo) {

            match(Tokens.parentesis_izquierdo);
            ee();
            c();
            u();

        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float, Tokens.parentesis_izquierdo);
        }
    }

    private void u() {
        if (lookahed.getToken() == Tokens.multiplicacion) {
            match(Tokens.multiplicacion);
            t();
            x();

        } else if (lookahed.getToken() == Tokens.division) {

            match(Tokens.division);
            t();
            x();
        } else if (lookahed.getToken() == Tokens.WHERE || lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.parentesis_derecho || lookahed.getToken() == Tokens.parentesis_izquierdo) {
            return;
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.multiplicacion, Tokens.division, Tokens.WHERE, Tokens.Float, Tokens.GO);
        }
    }

    private void f() {
        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Identificador || lookahed.getToken() == Tokens.Float) {
            datatipoupdate();

        } else if (lookahed.getToken() == Tokens.parentesis_izquierdo) {

            match(Tokens.parentesis_izquierdo);
            ee();
            c();

        } else {
            error(Tokens.String, Tokens.Bool, Tokens.Int, Tokens.Float, Tokens.parentesis_izquierdo);
        }
    }

    private void c() {
        if (lookahed.getToken() == Tokens.parentesis_derecho) {
            match(Tokens.parentesis_derecho);

        } else {
            error(Tokens.parentesis_derecho);
        }
    }

    private void asignacionesprima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            igobjeto_nombre();
            match(Tokens.igual);
            asignaciones();

        } else if (lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.punto_coma) {

            finalizar();

        } else if (lookahed.getToken() == Tokens.WHERE) {
            return;
        } else {
            error(Tokens.coma, Tokens.GO, Tokens.punto_coma);
        }
    }

    //-------------------------------------------------------------------------------------------------
    private void insert() {
        if (lookahed.getToken() == Tokens.INSERT) {
            match(Tokens.INSERT);
            g();
            Iobjeto_nombre();
            a2();
            b2();

        } else {
            error(Tokens.INSERT);
        }
    }

    private void g() {
        if (lookahed.getToken() == Tokens.INTO) {
            match(Tokens.INTO);

        } else if (lookahed.getToken() == Tokens.Identificador) {
            return;
        } else {
            error(Tokens.INTO, Tokens.punto_coma);
        }
    }

    private void a2() {
        if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
            match(Tokens.parentesis_izquierdo);
            c2();
            match(Tokens.parentesis_derecho);

        } else if (lookahed.getToken() == Tokens.VALUES || lookahed.getToken() == Tokens.DEFAULT) {
            return;
        } else {
            error(Tokens.coma, Tokens.GO, Tokens.punto_coma);
        }
    }

    private void c2() {
        if (lookahed.getToken() == Tokens.Identificador) {
            match(Tokens.Identificador);
            c2prima();

        } else {
            error(Tokens.Identificador);
        }
    }

    private void c2prima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            c2();

        } else if (lookahed.getToken() == Tokens.coma || lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.coma, Tokens.parentesis_derecho);
        }
    }

    private void b2() {
        if (lookahed.getToken() == Tokens.VALUES) {
            match(Tokens.VALUES);
            d2();

        } else if (lookahed.getToken() == Tokens.DEFAULT) {
            match(Tokens.DEFAULT);
            match(Tokens.VALUES);
            finalizar();
        } else {
            error(Tokens.coma, Tokens.parentesis_derecho);
        }
    }

    private void d2() {
        if (lookahed.getToken() == Tokens.parentesis_izquierdo) {
            match(Tokens.parentesis_izquierdo);
            e2();
            match(Tokens.parentesis_derecho);
            d2prima();
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }

    private void d2prima() {

        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            d2();
        } else if (lookahed.getToken() == Tokens.punto_coma || lookahed.getToken() == Tokens.GO) {
            finalizar();
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }

    private void e2() {

        if (lookahed.getToken() == Tokens.String || lookahed.getToken() == Tokens.Bool || lookahed.getToken() == Tokens.Int || lookahed.getToken() == Tokens.Float || lookahed.getToken() == Tokens.NULL) {
            f2();
            e2prima();
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }

    private void f2() {
        if (lookahed.getToken() == Tokens.String) {
            match(Tokens.String);
        } else if (lookahed.getToken() == Tokens.Bool) {
            match(Tokens.Bool);
        } else if (lookahed.getToken() == Tokens.Int) {
            match(Tokens.Int);

        } else if (lookahed.getToken() == Tokens.Float) {
            match(Tokens.Float);
        } else if (lookahed.getToken() == Tokens.NULL) {
            match(Tokens.NULL);
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }

    private void e2prima() {
        if (lookahed.getToken() == Tokens.coma) {
            match(Tokens.coma);
            e2();
        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }
//-----------------------------delete

    private void delete() {
        if (lookahed.getToken() == Tokens.DELETE) {
            match(Tokens.DELETE);
            opciones_delete();
            match(Tokens.FROM);
            wobjeto_nombre();
            condicionales();
        } else if (lookahed.getToken() == Tokens.parentesis_derecho) {
            return;
        } else {
            error(Tokens.parentesis_izquierdo);
        }
    }

    private void wobjeto_nombre() {
        if (lookahed.getToken() == Tokens.Identificador) {

            match(Tokens.Identificador);
            wobjeto_nombreprima();

        } else {
            error(Tokens.Identificador);
        }

    }

    private void wobjeto_nombreprima() {
        if (lookahed.getToken() == Tokens.punto) {

            match(Tokens.punto);
            match(Tokens.Identificador);
            wobjeto_nombre1prima();

        } else if (lookahed.getToken() == Tokens.WHERE) {
            return;
        } else if (lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.punto_coma) {
            finalizar();
        } else {
            error(Tokens.punto, Tokens.WHERE);
        }

    }

    private void wobjeto_nombre1prima() {
        if (lookahed.getToken() == Tokens.ON) {

            match(Tokens.punto);
            match(Tokens.Identificador);

        } else if (lookahed.getToken() == Tokens.WHERE) {
            return;
        } else if (lookahed.getToken() == Tokens.GO || lookahed.getToken() == Tokens.punto_coma) {
            finalizar();
        } else {
            error(Tokens.punto, Tokens.WHERE);
        }
    }

    private void opciones_delete() {
        if (lookahed.getToken() == Tokens.TOP) {
            match(Tokens.TOP);
            e();
            percentdelete();

        } else if (lookahed.getToken() == Tokens.FROM) {
            return;
        } else {
            error(Tokens.TOP, Tokens.FROM);
        }
    }

    private void percentdelete() {
        if (lookahed.getToken() == Tokens.PERCENT) {
            match(Tokens.PERCENT);

        } else if (lookahed.getToken() == Tokens.FROM) {

            return;
        } else {
            error(Tokens.TOP, Tokens.FROM);

        }
    }
}
