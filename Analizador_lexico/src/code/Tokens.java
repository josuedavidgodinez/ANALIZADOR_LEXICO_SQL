/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import org.omg.PortableInterceptor.USER_EXCEPTION;

/**
 *
 * @author godin
 */
public enum Tokens {

    Reservadas,
    Error_de_Identificador,
    Identificador,
    Int,
    Float,
    String,
    Bool,
    error_String_no_completado,
    Float_malo,
    ERROR,
    suma,
    resta,
    multiplicacion,
    division,
    modular,
    menor,
    menor_igual,
    mayor,
    mayor_igual,
    igual,
    comparar,
    diferente,
    and,
    or,
    exclamacion,
    coma,
    punto,
    corchete_derecho,
    corchete_izquierdo,
    parentesis_izquierdo,
    parentesis_derecho,
    llave_izquierda,
    llave_derecha,
    doble_corchete,
    doble_parentesis,
    doble_llave,
    arroba,
    numeral,
    doble_numeral,
    comentario_con_error,
    //tokens de palabras reservadas
    ADD, EXTERNAL, PROCEDURE, ALL, FETCH, PUBLIC, FILE, RAISERROR, FOR, FOREIGN, FROM, GROUP, BY, HAVING, ROWCOUNT, CASE, IDENTITY, CLUSTERED, IN, INDEX, SELECT, INNER, INTO, CONSTRAINT, JOIN, SET, INSERT, LEFT, NONCLUSTERED, TOP, CREATE, TABLE, NOT, DATABASE, NULL, TRANSACTION, TRUNCATE, DECLARE, DEFAULT, DELETE, ON, DESC, UPDATE, DISTINCT, DOUBLE, DROP, OR, VALUES, ORDER, OUTER, VIEW, OVER, PERCENT, WHEN, WHERE, WHILE, EXEC, PRECISION, WITH, WITHIN, EXISTS, PRINT, ALTER, AND, FIRST, FLOAT, ASC, BIT, COUNT, ELSE, WRITE, RIGHT, UNIQUE, TEXT, MAX, VARBINARY, INT, PRIMARY, KEY, REFERENCES, CHECK, INCLUDE, LIMIT, LIKE, BETWEEN, IS, THEN, END, NULLS, LAST, COLUMN, LOGIN, PASSWORD, UNLOCK, CREDENTIAL, VARCHAR,
    DATE,
    REAL,
    DISABLE,
    REBUILD,
    UNUSABLE,
    USABLE,
    MODIFY,
    NAME,
    CURRENT,
    USER,
    NUMERIC,
    DECIMAL,
    final_texto,
    TO,
    PARTITIONS,
    final_de_cadena,
    IF,
    punto_coma,
    AS,
    GO,
    DATETIME,
    CHAR,
    SUM,
    AVG,
    MIN,
    FULL

}
