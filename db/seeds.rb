DeckBuilder.new.deck do
  create_deck do
    deck_name "Corrupción"
    deck_slug "corrupcion"
    deck_description %Q{Imagínate que vas por ahí y ves 10€. Serán de alguien, pero no se sabe de quién, y si los coges nadie se va a enterar. ¿Los cogerías?\nY ahora imaginate que "vas por ahí" y que puedes coger 10 millones y que tampoco nadie se va a enterar.}
  end

  create_question do
    title "Estás en una oficina de correos y te dan mal el cambio"
    options "Te lo quedas, total no es mucho", "Avisas al empleado"
  end

  create_question do
    title "Hay una gran cola pero nadie te vería si te la saltas"
    options "Aguardo mi turno, a pesar de que supone esperar media hora", "Me la salto"
  end

  create_question do
    title "Vas a dejar tu trabajo y tienes la posibilidad de arreglar con tu jefe que te haga un falso despido para cobrar el paro"
    options "Lo hago, total hay gente que roba mucho más", "Me voy sin paro"
  end

  create_question do
    title "Los tornos del metro están abiertos"
    options "Me cuelo, nadie me ve", "Pago mi billete"
  end

  create_question do
    title "¿Alguna vez has falta al trabajo poniendo como excusa que estabas malo, cuando no lo estabas?"
    options "No lo recuerdo", "Alguna vez", "No"
  end

  create_question do
    title "Viene un electricista a hacerte un arreglo a casa y te dice que si quieres factura te tiene que subir el importe de la reparación para incluir el IVA"
    options "Prefieres ahorrarte el impuesto",  "Le exiges la factura aún costándote más"
  end

  create_question do
    title "Encuentras una cartera con billetes dentro"
    options "Te lo quedas, total ya está perdida", "Intentas encontrar al dueño"
  end
end
