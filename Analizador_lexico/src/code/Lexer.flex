package code;
import static code.Tokens.*;
%%
%class Lexer
%type Tokens
%line
%column

L=[a-zA-Z]
guion="_"
D=[0-9]
blank =[ \t\r\n]



LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "--" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*
comentarioerror     =  ("/*"[^\r\n.*]*)
Stringerror     =  ("'"([^'\r\n])*)
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

%{
    public String lexeme;
     public int columna;
    public int linea;
%}
%%
("ADD") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ADD;}
("EXTERNAL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return EXTERNAL;}
("PROCEDURE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PROCEDURE;}
("ALL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ALL;}
("FETCH") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FETCH;}
("PUBLIC") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PUBLIC;}
("FILE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FILE;}
("RAISERROR") {lexeme=yytext(); columna=yycolumn; linea=yyline; return RAISERROR;}
("FOR") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FOR;}
("FOREIGN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FOREIGN;}
("FROM") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FROM;}
("GROUP") {lexeme=yytext(); columna=yycolumn; linea=yyline; return GROUP;}
("BY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return BY;}
("HAVING") {lexeme=yytext(); columna=yycolumn; linea=yyline; return HAVING;}
("ROWCOUNT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ROWCOUNT;}
("CASE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CASE;}
("IDENTITY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return IDENTITY;}
("CLUSTERED") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CLUSTERED;}
("IN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return IN;}
("INDEX") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INDEX;}
("SELECT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return SELECT;}
("INNER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INNER;}
("INTO") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INTO;}
("CONSTRAINT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CONSTRAINT;}
("JOIN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return JOIN;}
("SET") {lexeme=yytext(); columna=yycolumn; linea=yyline; return SET;}
("INSERT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INSERT;}
("LEFT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return LEFT;}
("NONCLUSTERED") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NONCLUSTERED;}
("TOP") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TOP;}
("CREATE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CREATE;}
("TABLE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TABLE;}
("NOT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NOT;}
("DATABASE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DATABASE;}
("NULL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NULL;}
("TRANSACTION") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TRANSACTION;}
("TRUNCATE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TRUNCATE;}
("DECLARE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DECLARE;}
("DEFAULT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DEFAULT;}
("DELETE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DELETE;}
("ON") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ON;}
("DESC") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DESC;}
("UPDATE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return UPDATE;}
("DISTINCT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DISTINCT;}
("DOUBLE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DOUBLE;}
("DROP") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DROP;}
("OR") {lexeme=yytext(); columna=yycolumn; linea=yyline; return OR;}
("VALUES") {lexeme=yytext(); columna=yycolumn; linea=yyline; return VALUES;}
("ORDER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ORDER;}
("OUTER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return OUTER;}
("VIEW") {lexeme=yytext(); columna=yycolumn; linea=yyline; return VIEW;}
("OVER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return OVER;}
("PERCENT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PERCENT;}
("WHEN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WHEN;}
("WHERE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WHERE;}
("WHILE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WHILE;}
("EXEC") {lexeme=yytext(); columna=yycolumn; linea=yyline; return EXEC;}
("PRECISION") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PRECISION;}
("WITH") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WITH;}
("WITHIN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WITHIN;}
("EXISTS") {lexeme=yytext(); columna=yycolumn; linea=yyline; return EXISTS;}
("PRINT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PRINT;}
("ALTER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ALTER;}
("AND") {lexeme=yytext(); columna=yycolumn; linea=yyline; return AND;}
("FIRST") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FIRST;}
("FLOAT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FLOAT;}
("ASC") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ASC;}
("BIT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return BIT;}
("COUNT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return COUNT;}
("ELSE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return ELSE;}
("WRITE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return WRITE;}
("RIGHT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return RIGHT;}
("UNIQUE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return UNIQUE;}
("TEXT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TEXT;}
("MAX") {lexeme=yytext(); columna=yycolumn; linea=yyline; return MAX;}
("VARBINARY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return VARBINARY;}
("INT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INT;}
("PRIMARY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PRIMARY;}
("KEY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return KEY;}
("REFERENCES") {lexeme=yytext(); columna=yycolumn; linea=yyline; return REFERENCES;}
("CHECK") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CHECK;}
("INCLUDE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return INCLUDE;}
("LIMIT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return LIMIT;}
("LIKE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return LIKE;}
("BETWEEN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return BETWEEN;}
("IS") {lexeme=yytext(); columna=yycolumn; linea=yyline; return IS;}
("THEN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return THEN;}
("END") {lexeme=yytext(); columna=yycolumn; linea=yyline; return END;}
("NULLS") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NULLS;}
("LAST") {lexeme=yytext(); columna=yycolumn; linea=yyline; return LAST;}
("COLUMN") {lexeme=yytext(); columna=yycolumn; linea=yyline; return COLUMN;}
("LOGIN ") {lexeme=yytext(); columna=yycolumn; linea=yyline; return LOGIN;}
("PASSWORD") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PASSWORD;}
("UNLOCK") {lexeme=yytext(); columna=yycolumn; linea=yyline; return UNLOCK;}
("CREDENTIAL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CREDENTIAL;}
("IF") {lexeme=yytext(); columna=yycolumn; linea=yyline; return IF;}
("PARTITIONS") {lexeme=yytext(); columna=yycolumn; linea=yyline; return PARTITIONS;}
("TO") {lexeme=yytext(); columna=yycolumn; linea=yyline; return TO;}
("USER") {lexeme=yytext(); columna=yycolumn; linea=yyline; return USER;}
("CURRENT") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CURRENT;}
("MODIFY") {lexeme=yytext(); columna=yycolumn; linea=yyline; return MODIFY;}
("NAME") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NAME;}
("DISABLE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DISABLE;}
("REBUILD") {lexeme=yytext(); columna=yycolumn; linea=yyline; return REBUILD;}
("UNUSABLE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return UNUSABLE;}
("USABLE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return USABLE;}
("VARCHAR") {lexeme=yytext(); columna=yycolumn; linea=yyline; return VARCHAR;}
("DATE") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DATE;}
("REAL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return REAL;}
("AS")  {lexeme=yytext(); columna=yycolumn; linea=yyline; return AS;}
("GO") {lexeme=yytext(); columna=yycolumn; linea=yyline; return GO;}
("NUMERIC") {lexeme=yytext(); columna=yycolumn; linea=yyline; return NUMERIC;}
("DECIMAL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DECIMAL;}
("DATETIME") {lexeme=yytext(); columna=yycolumn; linea=yyline; return DATETIME;}
("CHAR") {lexeme=yytext(); columna=yycolumn; linea=yyline; return CHAR;}
("SUM")  {lexeme=yytext(); columna=yycolumn; linea=yyline; return SUM;}
("AVG")  {lexeme=yytext(); columna=yycolumn; linea=yyline; return AVG;}
("MIN")  {lexeme=yytext(); columna=yycolumn; linea=yyline; return MIN;}
("FULL") {lexeme=yytext(); columna=yycolumn; linea=yyline; return FULL;}

 TRAN
|OFF
|TRY_CONVERT
|OFFSETS
|TSEQUAL
|UNION
|DENY
|OPEN
|OPENDATASOURCE
|UNPIVOT
|DISK
|OPENQUERY
|OPENROWSET
|UPDATETEXT
|DISTRIBUTED
|OPENXML
|USE
|VARYING
|DUMP
|WAITFOR
|ERRLVL
|ESCAPE
|PIVOT
|OPTION

|EXCEPT
|PLAN
|EXECUTE
|WRITETEXT
|EXIT
|PROC
|ABSOLUTE
|OVERLAPS
|ACTION
|EXECUTE
|PAD
|ADA
|PARTIAL
|EXTRACT
|POSITION
|ALLOCATE
|FALSE
|PREPARE
|PRESERVE
|ANY
|ARE
|PRIOR

|PRIVILEGES
|FORTRAN
|PROCEDURE
|ASSERTION
|FOUND
|AT
|READ
|AUTHORIZATION
|FULL

|GET
|BEGIN
|GLOBAL
|RELATIVE

|RESTRICT
|GOTO
|REVOKE
|BIT_LENGTH
|GRANT
|BOTH
|ROLLBACK
|ROWS
|CASCADE
|HOUR
|SCHEMA
|CASCADED
|SCROLL
|IMMEDIATE
|SECOND
|CAST
|SECTION
|CATALOG
|CHAR
|SESSION
|CHAR_LENGTH
|INDICATOR
|SESSION_USER
|CHARACTER
|INITIALLY
|CHARACTER_LENGTH
|SIZE
|INPUT
|SMALLINT
|CLOSE
|INSENSITIVE
|SOME
|COALESCE
|SPACE
|COLLATE
|SQL
|COLLATION
|INTEGER
|SQLCA
|INTERSECT
|SQLCODE
|COMMIT
|INTERVAL
|SQLERROR
|CONNECT
|SQLSTATE
|CONNECTION
|SQLWARNING
|ISOLATION
|SUBSTRING
|CONSTRAINTS

|CONTINUE
|SYSTEM_USER
|CONVERT
|LANGUAGE
|CORRESPONDING
|TEMPORARY
|OPTION
|LEADING
|TIME
|CROSS
|LEVEL
|TIMESTAMP
|CURRENT
|TIMEZONE_HOUR
|CURRENT_DATE
|LOCAL
|TIMEZONE_MINUTE
|CURRENT_TIME
|LOWER
|TO
|CURRENT_TIMESTAMP
|MATCH
|TRAILING
|CURRENT_USER
|CURSOR
|TRANSLATE
|MINUTE
|TRANSLATION
|DAY
|MODULE
|TRIM
|DEALLOCATE
|MONTH
|TRUE
|DEC
|NAMES
|UNION
|NATIONAL
|NATURAL
|UNKNOWN
|NCHAR
|DEFERRABLE
|NEXT
|UPPER
|DEFERRED
|NO
|USAGE
|NONE

|USING
|DESCRIBE
|VALUE
|DESCRIPTOR
|NULLIF
|DIAGNOSTICS

|DISCONNECT
|OCTET_LENGTH
|VARYING
|OF
|DOMAIN
|ONLY
|WHENEVER
|OPEN
|WORK
|CURSOR
|SYSTEM_USER
|CROSS
|LINENO
|CONTAINS
|SESSION_USER
|SEMANTICKEYPHRASETABLE
|COLLATE
|SECURITYAUDIT
|COALESCE
|ROWGUIDCOL
|IDENTITY_INSERT
|RULE
|CHECKPOINT
|IDENTITYCOL
|SAVE
|CLOSE
|SCHEMA
|ROLLBACK
|CASCADE
|HOLDLOCK
|RESTORE
|BEGIN
|RESTRICT
|FUNCTION
|RETURN
|BREAK
|GOTO
|REVERT
|BROWSE
|GRANT
|REVOKE
|BULK
|RECONFIGURE
|ASC
|FREETEXT
|AUTHORIZATION
|FREETEXTTABLE
|REPLICATION
|BACKUP
|READTEXT
|AS
|FILLFACTOR
|READ
|ANY
|SEMANTICSIMILARITYDETAILSTABLE
|COMMIT
|INTERSECT
|SEMANTICSIMILARITYTABLE
|COMPUTE
|SETUSER
|CONTAINSTABLE
|SHUTDOWN
|CONTINUE
|KILL
|SOME
|CONVERT
|STATISTICS
|CURRENT
|LOAD
|TABLESAMPLE
|CURRENT_DATE
|MERGE
|TEXTSIZE
|CURRENT_TIME
|NATIONAL
|CURRENT_TIMESTAMP
|NOCHECK

|CURRENT_USER
|DBCC
|NULLIF
|TRIGGER
|DEALLOCATE
|OF
|ESCAPE
|YEAR
|EXCEPT
|OUTPUT
|ZONE
|EXCEPTION {lexeme=yytext(); columna=yycolumn; linea=yyline; return Reservadas;}



{blank} {/*Ignore*/}

{Comment}         {/*Ignore*/}

{comentarioerror} {lexeme=yytext(); columna=yycolumn;  linea=yyline; return comentario_con_error;}

{Stringerror} {lexeme=yytext(); columna=yycolumn;  linea=yyline; return error_String_no_completado;}



({L}({L}|{D}|{guion}){0,30})|("["{L}({L}|{D}|{guion}){0,30}"]") {lexeme=yytext();columna=yycolumn; linea=yyline; return Identificador;}

({L}({L}|{D}|{guion}){30}) ({L}({L}|{D}|{guion}))+ {lexeme=yytext(); columna=yycolumn; linea=yyline; return Error_de_Identificador;}

("(-"{D}+")")|{D}+ {lexeme=yytext(); columna=yycolumn; linea=yyline;  return Int;}

"0"|"1"|"NULL" {lexeme=yytext(); columna=yycolumn; linea=yyline; return Bool;}

(({D})+ (".") ({D})*)|(({D})+ (".") ({D})*("E+")({D})+ ) {lexeme=yytext(); columna=yycolumn; linea=yyline;  return Float;}

((".")({D})+)|((".")({D})*("E+")({D})+) {lexeme=yytext();columna=yycolumn;  linea=yyline; return Float_malo;}

("'"([^'\r\n])*"'") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return String;}



("+") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return suma;}
(";") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return punto_coma;}
("-") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return resta;}
("*") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return multiplicacion;}
("/") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return division;}
("%") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return modular;}
("<") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return menor;}
("<=") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return menor_igual;}
(">") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return mayor;}
(">=") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return mayor_igual;}
("=") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return igual;}
("==") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return comparar;}
("!=") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return diferente;}
("&&") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return and;}
("||") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return or;}
("!") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return exclamacion;}
(";") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return punto_coma;}
(",") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return coma;}
(".") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return punto;}
("[") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return corchete_derecho;}
("]") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return corchete_izquierdo;}
("(") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return parentesis_izquierdo;}
(")") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return parentesis_derecho;}
("{") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return llave_izquierda;}
("}") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return llave_derecha;}
("[]") {lexeme=yytext(); columna=yycolumn;  linea=yyline;  return doble_corchete;}
("()") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return doble_parentesis;}
("{}") {lexeme=yytext(); columna=yycolumn; linea=yyline;  return doble_llave;}
("@") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return arroba;}
("#") {lexeme=yytext(); columna=yycolumn;  linea=yyline; return numeral;}
("##") {lexeme=yytext(); columna=yycolumn;  linea=yyline;  return doble_numeral;}



 . {lexeme=yytext(); columna=yycolumn;  linea=yyline;  return ERROR;}


