-- (01) Lugares que no visitará nadie


 SELECT lugar FROM lugares left JOIN viajaran USING(id_lugar) WHERE viajaran.id_lugar IS NULL;


-- (02) A que destinos va cada persona.

  
  SELECT persona, lugar FROM viajaran JOIN lugares USING(id_lugar) JOIN personas USING(id_persona);


  -- (03) ¿ que personas no viajarán?

   SELECT persona FROM viajaran  RIGHT JOIN personas ON personas.id_persona= viajaran.id_persona WHERE viajaran.id_persona IS NULL;


    -- (04) Persona que más viajará





    -- (05) lugar más visitado


-- c1
SELECT id_lugar,COUNT(*)n FROM viajaran GROUP BY id_lugar;


-- (06) Destino al que viajarán  todas las personas que viajan






-- (07) Personas que viajarán a todos los destinos


SELECT persona FROM (
    SELECT id_persona FROM viajaran GROUP BY 1
     HAVING COUNT(*) = (
        SELECT COUNT(DISTINCT id_lugar) FROM viajaran
    )
    )c3 JOIN personas USING(id_persona);






