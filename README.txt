Funcionamiento del analizador lexico para mini-sql
Como primer punto el programa obtendra un archivo con estension .flex el cual sera leido
por una libreria llamad JFlex.jar la cual se encargara de generar un alizador lexico para
el lenguaje mini-sql , donde a partir de la sintaxis que usa la libreria Jflex se definen
ciertos elemnetos de un lenguaje en el archivo .jflex.

Los elementos que se definiran son los siguientes:
-primero se definira todas las importaciones y el
paquete donde se econtrara nuestro programa que
servira de analizador lexico
-segundo de delimitan estas importaciones y paquete por un:
'%%', de ahi escribimos ciertas funcionalidades de la clase
Jflex para mejorar la salida de nuestros programa que servira
como analizador, presendidos por el simbolo '%'
-Luego se definiran los simbolos del lenguaje , para este caso 
se definieron los digitos por medio de un rango que se escribe 
como: [numero_inicial-numero_final], de igual forma se realizo con
el abecedario, para simbolos individuales se definieon encerrados 
por comillas dobles, y para evitar unos caracteres especificos pero 
si se queria usar todo los demas se utilizo la siguiente gramatica
^(simbolo_que_se_quiere_que aparezca),para la concatenacion solo
se continuaba con el siguiente simbolo ya sea encerrador por[] o por
{} o por () o por "".
-Luego se definieron las expresiones regulares que usara nuestro lenguaje
usando el simbolo '|' para hacer un or entre diferentes expresiones
para un token determinador, el simbolo '*' para indicar una sucesion
del simbolo que le precede de 0 a n veces en  y si es un '+' para indicar
una sucesiondel simbolo que le precede de 1 a n veces en el token, el simbolo 
'~' para definir una expresion en el token hasta que encuentre un simbolo
que le sigue al simbolo '~'  


