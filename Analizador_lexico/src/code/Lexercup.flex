package code;
import java_cup.runtime.Symbol;
%%
%class Lexercup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
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
    
   private Symbol symbol(int type,Object value){
  return new Symbol(type,yyline,yycolumn,value);
}

 private Symbol symbol(int type){
  return new Symbol(type,yyline,yycolumn);
}

%}
%%
("ADD") { return new Symbol(sym.ADD,yycolumn,yyline,yytext()) ;}
("EXTERNAL") {return new Symbol(sym.EXTERNAL,yycolumn,yyline,yytext());}
("PROCEDURE") {return new Symbol(sym.PROCEDURE,yycolumn,yyline,yytext());}
("ALL") {return new Symbol(sym.ALL,yycolumn,yyline,yytext());}
("FETCH") {return new Symbol(sym.FETCH,yycolumn,yyline,yytext());}
("PUBLIC") {return new Symbol(sym.PUBLIC,yycolumn,yyline,yytext());}
("FILE") {return new Symbol(sym.FILE,yycolumn,yyline,yytext());}
("RAISERROR") {return new Symbol(sym.RAISERROR,yycolumn,yyline,yytext());}
("FOR") {return new Symbol(sym.FOR,yycolumn,yyline,yytext());}
("FOREIGN") {return new Symbol(sym.FOREIGN,yycolumn,yyline,yytext());}
("FROM") {return new Symbol(sym.FROM,yycolumn,yyline,yytext());}
("GROUP") {return new Symbol(sym.GROUP,yycolumn,yyline,yytext());}
("BY") {return new Symbol(sym.BY,yycolumn,yyline,yytext());}
("HAVING") {return new Symbol(sym.HAVING,yycolumn,yyline,yytext());}
("ROWCOUNT") {return new Symbol(sym.ROWCOUNT,yycolumn,yyline,yytext());}
("CASE") {return new Symbol(sym.CASE,yycolumn,yyline,yytext());}
("IDENTITY") {return new Symbol(sym.IDENTITY,yycolumn,yyline,yytext());}
("CLUSTERED") {return new Symbol(sym.CLUSTERED,yycolumn,yyline,yytext());}
("IN") {return new Symbol(sym.IN,yycolumn,yyline,yytext());}
("INDEX") {return new Symbol(sym.INDEX,yycolumn,yyline,yytext());}
("SELECT") {return new Symbol(sym.SELECT,yycolumn,yyline,yytext());}
("INNER") {return new Symbol(sym.INNER,yycolumn,yyline,yytext());}
("INTO") {return new Symbol(sym.INTO,yycolumn,yyline,yytext());}
("CONSTRAINT") {return new Symbol(sym.CONSTRAINT,yycolumn,yyline,yytext());}
("JOIN") {return new Symbol(sym.JOIN,yycolumn,yyline,yytext());}
("SET") {return new Symbol(sym.SET,yycolumn,yyline,yytext());}
("INSERT") {return new Symbol(sym.INSERT,yycolumn,yyline,yytext());}
("LEFT") {return new Symbol(sym.LEFT,yycolumn,yyline,yytext());}
("NONCLUSTERED") {return new Symbol(sym.NONCLUSTERED,yycolumn,yyline,yytext());}
("TOP") {return new Symbol(sym.TOP,yycolumn,yyline,yytext());}
("CREATE") {return new Symbol(sym.CREATE,yycolumn,yyline,yytext());}
("TABLE") {return new Symbol(sym.TABLE,yycolumn,yyline,yytext());}
("NOT") {return new Symbol(sym.NOT,yycolumn,yyline,yytext());}
("DATABASE") {return new Symbol(sym.DATABASE,yycolumn,yyline,yytext());}
("NULL") {return new Symbol(sym.NULL,yycolumn,yyline,yytext());}
("TRANSACTION") {return new Symbol(sym.TRANSACTION,yycolumn,yyline,yytext());}
("TRUNCATE") {return new Symbol(sym.TRUNCATE,yycolumn,yyline,yytext());}
("DECLARE") {return new Symbol(sym.DECLARE,yycolumn,yyline,yytext());}
("DEFAULT") {return new Symbol(sym.DEFAULT,yycolumn,yyline,yytext());}
("DELETE") {return new Symbol(sym.DELETE,yycolumn,yyline,yytext());}
("ON") {return new Symbol(sym.ON,yycolumn,yyline,yytext());}
("DESC") {return new Symbol(sym.DESC,yycolumn,yyline,yytext());}
("UPDATE") {return new Symbol(sym.UPDATE,yycolumn,yyline,yytext());}
("DISTINCT") {return new Symbol(sym.DISTINCT,yycolumn,yyline,yytext());}
("DOUBLE") {return new Symbol(sym.DOUBLE,yycolumn,yyline,yytext());}
("DROP") {return new Symbol(sym.DROP,yycolumn,yyline,yytext());}
("OR") {return new Symbol(sym.OR,yycolumn,yyline,yytext());}
("VALUES") {return new Symbol(sym.VALUES,yycolumn,yyline,yytext());}
("ORDER") {return new Symbol(sym.ORDER,yycolumn,yyline,yytext());}
("OUTER") {return new Symbol(sym.OUTER,yycolumn,yyline,yytext());}
("VIEW") {return new Symbol(sym.VIEW,yycolumn,yyline,yytext());}
("OVER") {return new Symbol(sym.OVER,yycolumn,yyline,yytext());}
("PERCENT") {return new Symbol(sym.PERCENT,yycolumn,yyline,yytext());}
("WHEN") {return new Symbol(sym.WHEN,yycolumn,yyline,yytext());}
("WHERE") {return new Symbol(sym.WHERE,yycolumn,yyline,yytext());}
("WHILE") {return new Symbol(sym.WHILE,yycolumn,yyline,yytext());}
("EXEC") {return new Symbol(sym.EXEC,yycolumn,yyline,yytext());}
("PRECISION") {return new Symbol(sym.PRECISION,yycolumn,yyline,yytext());}
("WITH") {return new Symbol(sym.WITH,yycolumn,yyline,yytext());}
("WITHIN") {return new Symbol(sym.WITHIN,yycolumn,yyline,yytext());}
("EXISTS") {return new Symbol(sym.EXISTS,yycolumn,yyline,yytext());}
("PRINT") {return new Symbol(sym.PRINT,yycolumn,yyline,yytext());}
("ALTER") {return new Symbol(sym.ALTER,yycolumn,yyline,yytext());}
("AND") {return new Symbol(sym.AND,yycolumn,yyline,yytext());}
("FIRST") {return new Symbol(sym.FIRST,yycolumn,yyline,yytext());}
("FLOAT") {return new Symbol(sym.FLOAT,yycolumn,yyline,yytext());}
("ASC") {return new Symbol(sym.ASC,yycolumn,yyline,yytext());}
("BIT") {return new Symbol(sym.BIT,yycolumn,yyline,yytext());}
("COUNT") {return new Symbol(sym.COUNT,yycolumn,yyline,yytext());}
("ELSE") {return new Symbol(sym.ELSE,yycolumn,yyline,yytext());}
("WRITE") {return new Symbol(sym.WRITE,yycolumn,yyline,yytext());}
("RIGHT") {return new Symbol(sym.RIGHT,yycolumn,yyline,yytext());}
("UNIQUE") {return new Symbol(sym.UNIQUE,yycolumn,yyline,yytext());}
("TEXT") {return new Symbol(sym.TEXT,yycolumn,yyline,yytext());}
("MAX") {return new Symbol(sym.MAX,yycolumn,yyline,yytext());}
("VARBINARY") {return new Symbol(sym.VARBINARY,yycolumn,yyline,yytext());}
("INT") {return new Symbol(sym.INT,yycolumn,yyline,yytext());}
("PRIMARY") {return new Symbol(sym.PRIMARY,yycolumn,yyline,yytext());}
("KEY") {return new Symbol(sym.KEY,yycolumn,yyline,yytext());}
("REFERENCES") {return new Symbol(sym.REFERENCES,yycolumn,yyline,yytext());}
("CHECK") {return new Symbol(sym.CHECK,yycolumn,yyline,yytext());}
("INCLUDE") {return new Symbol(sym.INCLUDE,yycolumn,yyline,yytext());}
("LIMIT") {return new Symbol(sym.LIMIT,yycolumn,yyline,yytext());}
("LIKE") {return new Symbol(sym.LIKE,yycolumn,yyline,yytext());}
("BETWEEN") {return new Symbol(sym.BETWEEN,yycolumn,yyline,yytext());}
("IS") {return new Symbol(sym.IS,yycolumn,yyline,yytext());}
("THEN") {return new Symbol(sym.THEN,yycolumn,yyline,yytext());}
("END") {return new Symbol(sym.END,yycolumn,yyline,yytext());}
("NULLS") {return new Symbol(sym.NULLS,yycolumn,yyline,yytext());}
("LAST") {return new Symbol(sym.LAST,yycolumn,yyline,yytext());}
("COLUMN") {return new Symbol(sym.COLUMN,yycolumn,yyline,yytext());}
("LOGIN") {return new Symbol(sym.LOGIN,yycolumn,yyline,yytext());}
("PASSWORD") {return new Symbol(sym.PASSWORD,yycolumn,yyline,yytext());}
("UNLOCK") {return new Symbol(sym.UNLOCK,yycolumn,yyline,yytext());}
("CREDENTIAL") {return new Symbol(sym.CREDENTIAL,yycolumn,yyline,yytext());}
("IF") {return new Symbol(sym.IF,yycolumn,yyline,yytext());}
("PARTITIONS") {return new Symbol(sym.PARTITIONS,yycolumn,yyline,yytext());}
("TO") {return new Symbol(sym.TO,yycolumn,yyline,yytext());}
("USER") {return new Symbol(sym.USER,yycolumn,yyline,yytext());}
("CURRENT") {return new Symbol(sym.CURRENT,yycolumn,yyline,yytext());}
("MODIFY") {return new Symbol(sym.MODIFY,yycolumn,yyline,yytext());}
("NAME") {return new Symbol(sym.NAME,yycolumn,yyline,yytext());}
("DISABLE") {return new Symbol(sym.DISABLE,yycolumn,yyline,yytext());}
("REBUILD") {return new Symbol(sym.REBUILD,yycolumn,yyline,yytext());}
("UNUSABLE") {return new Symbol(sym.UNUSABLE,yycolumn,yyline,yytext());}
("USABLE") {return new Symbol(sym.USABLE,yycolumn,yyline,yytext());}
("VARCHAR") {return new Symbol(sym.VARCHAR,yycolumn,yyline,yytext());}
("DATE") {return new Symbol(sym.DATE,yycolumn,yyline,yytext());}
("REAL") {return new Symbol(sym.REAL,yycolumn,yyline,yytext());}
("AS")  {return new Symbol(sym.AS,yycolumn,yyline,yytext());}
("GO") {return new Symbol(sym.GO,yycolumn,yyline,yytext());}
("NUMERIC") {return new Symbol(sym.NUMERIC,yycolumn,yyline,yytext());}
("DECIMAL") {return new Symbol(sym.DECIMAL,yycolumn,yyline,yytext());}
("DATETIME") {return new Symbol(sym.DATETIME,yycolumn,yyline,yytext());}
("CHAR") {return new Symbol(sym.CHAR,yycolumn,yyline,yytext());}
("SUM")  {return new Symbol(sym.SUM,yycolumn,yyline,yytext());}
("AVG")  {return new Symbol(sym.AVG,yycolumn,yyline,yytext());}
("MIN")  {return new Symbol(sym.MIN,yycolumn,yyline,yytext());}
("FULL") {return new Symbol(sym.FULL,yycolumn,yyline,yytext());}
("CURSOR") {return new Symbol(sym.CURSOR,yycolumn,yyline,yytext());}
("VARYING") {return new Symbol(sym.VARYING,yycolumn,yyline,yytext());}
("TRAN") {return new Symbol(sym.TRAN,yycolumn,yyline,yytext());}
("READONLY") {return new Symbol(sym.READONLY,yycolumn,yyline,yytext());}
("OUT") {return new Symbol(sym.OUT,yycolumn,yyline,yytext());}
("OUTPUT") {return new Symbol(sym.OUTPUT,yycolumn,yyline,yytext());}
("ENCRYPTION") {return new Symbol(sym.ENCRYPTION,yycolumn,yyline,yytext());}
("RECOMPILE") {return new Symbol(sym.ENCRYPTION,yycolumn,yyline,yytext());}
("EXECUTE") {return new Symbol(sym.EXECUTE,yycolumn,yyline,yytext());}
("SELF") {return new Symbol(sym.SELF,yycolumn,yyline,yytext());}
("CALLER") {return new Symbol(sym.CALLER,yycolumn,yyline,yytext());}
("OWNER") {return new Symbol(sym.OWNER,yycolumn,yyline,yytext());}
("REPLICATION") {return new Symbol(sym.REPLICATION,yycolumn,yyline,yytext());}
("BEGIN") {return new Symbol(sym.BEGIN,yycolumn,yyline,yytext());}
("FUNCTION") {return new Symbol(sym.FUNCTION,yycolumn,yyline,yytext());}
("RETURNS") {return new Symbol(sym.RETURNS,yycolumn,yyline,yytext());}
("SCHEMABINDING") {return new Symbol(sym.SCHEMABINDING,yycolumn,yyline,yytext());}
("EXECUTE_AS_CLAUSE") {return new Symbol(sym.EXECUTE_AS_CLAUSE,yycolumn,yyline,yytext());}
("CALLED") {return new Symbol(sym.CALLED,yycolumn,yyline,yytext());}
("INPUT") {return new Symbol(sym.INPUT,yycolumn,yyline,yytext());}
("INLINE") {return new Symbol(sym.INLINE,yycolumn,yyline,yytext());}
("RETURN") {return new Symbol(sym.RETURN,yycolumn,yyline,yytext());}
("OFF") {return new Symbol(sym.OFF,yycolumn,yyline,yytext());}

("LOCAL") {return new Symbol(sym.LOCAL,yycolumn,yyline,yytext());}
("GLOBAL") {return new Symbol(sym.GLOBAL,yycolumn,yyline,yytext());}
("SCROLL") {return new Symbol(sym.SCROLL,yycolumn,yyline,yytext());}
("FORWARD_ONLY") {return new Symbol(sym.FORWARD_ONLY,yycolumn,yyline,yytext());}
("STATIC") {return new Symbol(sym.STATIC,yycolumn,yyline,yytext());}
("KEYSET") {return new Symbol(sym.KEYSET,yycolumn,yyline,yytext());}
("DYNAMIC") {return new Symbol(sym.KEYSET,yycolumn,yyline,yytext());}
("FAST_FORWARD") {return new Symbol(sym.FAST_FORWARD,yycolumn,yyline,yytext());}
("SCROLL_LOCKS") {return new Symbol(sym.SCROLL_LOCKS,yycolumn,yyline,yytext());}
("OPTIMISTIC") {return new Symbol(sym.OPTIMISTIC,yycolumn,yyline,yytext());}
("TYPE_WARNING") {return new Symbol(sym.TYPE_WARNING,yycolumn,yyline,yytext());}
("OF") {return new Symbol(sym.OF,yycolumn,yyline,yytext());}

("NAMES") {return new Symbol(sym.NAMES,yycolumn,yyline,yytext());}
("FILES") {return new Symbol(sym.FILES,yycolumn,yyline,yytext());}
("FILENAME") {return new Symbol(sym.FILENAME,yycolumn,yyline,yytext());}
("SIZE") {return new Symbol(sym.SIZE,yycolumn,yyline,yytext());}
("KB") {return new Symbol(sym.KB,yycolumn,yyline,yytext());}
("MB") {return new Symbol(sym.MB,yycolumn,yyline,yytext());}
("GB") {return new Symbol(sym.GB,yycolumn,yyline,yytext());}
("TB") {return new Symbol(sym.TB,yycolumn,yyline,yytext());}
("MAXSIZE") {return new Symbol(sym.MAXSIZE,yycolumn,yyline,yytext());}
("FILEGROWTH") {return new Symbol(sym.FILEGROWTH,yycolumn,yyline,yytext());}
("TEXT") {return new Symbol(sym.TEXT,yycolumn,yyline,yytext());}
("IMAGE") {return new Symbol(sym.IMAGE,yycolumn,yyline,yytext());}
("DATETIME2") {return new Symbol(sym.DATETIME2,yycolumn,yyline,yytext());}
("SMALLDATETIME") {return new Symbol(sym.SMALLDATETIME,yycolumn,yyline,yytext());}
("TIME") {return new Symbol(sym.TIME,yycolumn,yyline,yytext());}
("DATETIMEOFFSET") {return new Symbol(sym.DATETIMEOFFSET,yycolumn,yyline,yytext());}
("TIMESTAMP") {return new Symbol(sym.TIMESTAMP,yycolumn,yyline,yytext());}
("MONEY") {return new Symbol(sym.MONEY,yycolumn,yyline,yytext());}
("DEFAULT_SCHEMA") {return new Symbol(sym.DEFAULT_SCHEMA,yycolumn,yyline,yytext());}
("ALLOW_ENCRYPTED_VALUE_MODIFICATIONS") {return new Symbol(sym.ALLOW_ENCRYPTED_VALUE_MODIFICATIONS,yycolumn,yyline,yytext());}

 ("COLLATE") {return new Symbol(sym.COLLATE,yycolumn,yyline,yytext());}
("ROLLBACK") {return new Symbol(sym.ROLLBACK,yycolumn,yyline,yytext());}
("UNION") {return new Symbol(sym.UNION,yycolumn,yyline,yytext());}
("INMEDIATE") {return new Symbol(sym.INMEDIATE,yycolumn,yyline,yytext());}
("MARK") {return new Symbol(sym.MARK,yycolumn,yyline,yytext());}
("DELAYED_DURABILITY") {return new Symbol(sym.DELAYED_DURABILITY,yycolumn,yyline,yytext());}
("SAVE") {return new Symbol(sym.SAVE,yycolumn,yyline,yytext());}
("USE") {return new Symbol(sym.USE,yycolumn,yyline,yytext());}
("PROC") {return new Symbol(sym.PROC,yycolumn,yyline,yytext());}
("COMMIT") {return new Symbol(sym.COMMIT,yycolumn,yyline,yytext());}
("NVARCHAR") {return new Symbol(sym.NVARCHAR,yycolumn,yyline,yytext());}
("INSENSITIVE") {return new Symbol(sym.INSENSITIVE,yycolumn,yyline,yytext());}
("SCROLL") {return new Symbol(sym.INSENSITIVE,yycolumn,yyline,yytext());}
TRY_CONVERT
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
|DUMP
|WAITFOR
|ERRLVL
|ESCAPE
|PIVOT
|OPTION

|EXCEPT
|PLAN

|WRITETEXT
|EXIT

|ABSOLUTE
|OVERLAPS
|ACTION
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
|ASSERTION
|FOUND
|AT
|READ
|AUTHORIZATION
|FULL
|GET
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
|IMMEDIATE
|SECOND
|CAST
|SECTION
|CATALOG

|SESSION
|CHAR_LENGTH
|INDICATOR
|SESSION_USER
|CHARACTER
|INITIALLY
|CHARACTER_LENGTH
|SMALLINT
|CLOSE

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

|CROSS
|LEVEL

|CURRENT
|TIMEZONE_HOUR
|CURRENT_DATE

|TIMEZONE_MINUTE
|CURRENT_TIME
|LOWER
|TO
|CURRENT_TIMESTAMP
|MATCH
|TRAILING
|CURRENT_USER
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


|DOMAIN
|ONLY
|WHENEVER
|OPEN
|WORK
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

|CLOSE
|SCHEMA
|ROLLBACK
|CASCADE
|HOLDLOCK
|RESTORE
|RESTRICT
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

|BACKUP
|READTEXT
|AS
|FILLFACTOR
|READ
|ANY
|SEMANTICSIMILARITYDETAILSTABLE

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

|ESCAPE
|YEAR
|EXCEPT

|ZONE
|EXCEPTION {return new Symbol(sym.Reservadas,yycolumn,yyline,yytext());}



{blank} {/*Ignore*/}

{Comment}         {/*Ignore*/}

{comentarioerror} {return new Symbol(sym.comentario_con_error,yycolumn,yyline,yytext());}

{Stringerror} {return new Symbol(sym.error_String_no_completado,yycolumn,yyline,yytext());}


({L}({L}|{D}|{guion})*)|("["{L}({L}|{D}|{guion})*"]") {
if(yytext().length()>31){
return new Symbol(sym.Identificador,yycolumn,yyline,yytext().substring(0,32));
}else {
return new Symbol(sym.Identificador,yycolumn,yyline,yytext());
}
} 




("(-"{D}+")")|{D}+ {return new Symbol(sym.Int,yycolumn,yyline,yytext());}

"0"|"1"|"NULL" {return new Symbol(sym.Bool,yycolumn,yyline,yytext());}

(({D})+ (".") ({D})*)|(({D})+ (".") ({D})*("E+")({D})+ ) {return new Symbol(sym.Float,yycolumn,yyline,yytext());}

("'"([^'\r\n])*"'") {return new Symbol(sym.String,yycolumn,yyline,yytext());}



("+") {return new Symbol(sym.suma,yycolumn,yyline,yytext());}
("$") {return new Symbol(sym.dolar,yycolumn,yyline,yytext());}
(";") {return new Symbol(sym.punto_coma,yycolumn,yyline,yytext());}
("-") {return new Symbol(sym.resta,yycolumn,yyline,yytext());}
("*") {return new Symbol(sym.multiplicacion,yycolumn,yyline,yytext());}
("/") {return new Symbol(sym.division,yycolumn,yyline,yytext());}
("%") {return new Symbol(sym.modular,yycolumn,yyline,yytext());}
("<") {return new Symbol(sym.menor,yycolumn,yyline,yytext());}
("<=") {return new Symbol(sym.menor_igual,yycolumn,yyline,yytext());}
(">") {return new Symbol(sym.mayor,yycolumn,yyline,yytext());}
(">=") {return new Symbol(sym.mayor_igual,yycolumn,yyline,yytext());}
("=") {return new Symbol(sym.igual,yycolumn,yyline,yytext());}
("==") {return new Symbol(sym.comparar,yycolumn,yyline,yytext());}
("!=") {return new Symbol(sym.diferente,yycolumn,yyline,yytext());}
("&&") {return new Symbol(sym.and,yycolumn,yyline,yytext());}
("||") {return new Symbol(sym.or,yycolumn,yyline,yytext());}
("!") {return new Symbol(sym.exclamacion,yycolumn,yyline,yytext());}
(";") {return new Symbol(sym.punto_coma,yycolumn,yyline,yytext());}
(",") {return new Symbol(sym.coma,yycolumn,yyline,yytext());}
(".") {return new Symbol(sym.punto,yycolumn,yyline,yytext());}
("[") {return new Symbol(sym.corchete_derecho,yycolumn,yyline,yytext());}
("]") {return new Symbol(sym.corchete_izquierdo,yycolumn,yyline,yytext());}
("(") {return new Symbol(sym.parentesis_izquierdo,yycolumn,yyline,yytext());}
(")") {return new Symbol(sym.parentesis_derecho,yycolumn,yyline,yytext());}
("{") {return new Symbol(sym.llave_izquierda,yycolumn,yyline,yytext());}
("}") {return new Symbol(sym.llave_derecha,yycolumn,yyline,yytext());}
("[]") {return new Symbol(sym.doble_corchete,yycolumn,yyline,yytext());}
("()") {return new Symbol(sym.doble_parentesis,yycolumn,yyline,yytext());}
("{}") {return new Symbol(sym.doble_llave,yycolumn,yyline,yytext());}
("@") {return new Symbol(sym.arroba,yycolumn,yyline,yytext());}
("#") {return new Symbol(sym.numeral,yycolumn,yyline,yytext());}
("##") {return new Symbol(sym.doble_numeral,yycolumn,yyline,yytext());}

 . {return new Symbol(sym.ERROR,yycolumn,yyline,yytext());}
 
 