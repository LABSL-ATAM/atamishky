SYNOPSIS
    Script para generar XML valido desde archivos csv, para utilizarlo como
    catalogo o indice de la bibliografia de Atamishky.

  Forma de uso:
    c Salida compacta : sin saltos de linea, ni espacios.
    f Archivo input : Ver debajo sobre el formato (csv),
    o Archivo Output : Opcional, por defecto STDOUT.
    t Archivo txt: genera "catalogo.txt" desde el csv.
    h (Esta) Ayuda.
    d Debug.

  Por ejemplo.
    ./atamishky_CSV2XML.pl -f minimo_pruebas.csv -o catalogo.xml -t
    
    Va a producir los archivos catalogo.xml y catalogo.txt.

Archivo en la entrada
    El archivo csv tiene que respetar en su encabezado, el siguiente orden:

<<<<<<< HEAD
    * tipo 
    * titulo 
    * autores 
    * editorial 
    * año 
    * ciudad 
    * bibliografia 
    * link 
    * soporte 
    * descripcion
=======
    * tipo * titulo * autores * editorial * año * ciudad * bibliografia *
    link * soporte * descripcion * idioma * paginas-capitulos.
>>>>>>> atam

    Los valores en todo el csv se separan con la pipa |.

   tipos
    Los tipos posibles son :

    * musica 
    * video 
    * book 
    * misc

   Autores
    Si la entrada tiene mas de un autor, separar con punto y coma.

    No poner "y" al final, la plantilla se encarga de eso.

   valores vacios
    Si no hay bibliografia o link que poner, no poner nada.

   Soporte
    El campo soporte solo tiene sentido si el tipo de entrada es igual a
    video.

   Salidas
    Manejar las salidas a gusto, xml, txt y stdout son las opciones.

    Estaba a punto de programar algo que lo convierta a pdf pero es un gasto
    innecesario de energia, pasarlo a un txt es mucho mas util calculo.

    Para todo lo demas existe pandoc.

Autor y Licencia.
    Programado por Marxbro aka Gstv, ditribuir solo bajo la licencia WTFPL:
    *Do What the Fuck You Want To Public License*.

    Zaijian.

