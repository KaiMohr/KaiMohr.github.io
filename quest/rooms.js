var rooms = {
    "start": {
        "name": "the beginning",
        "description": "You are in a dark, cold place and you see a light to north and you hear the sound of running water to the west",
        "escriptiones": "Estás en un lugar oscuro y frío y ves una luz hacia el norte y escuchas el sonido del agua corriendo hacia el oeste",
        "directions": {
            "north": "clearing1",
            "west": "bridge1",
            "end": "end",
        }
    },
    "clearing1": {
        "name": "clearing",
        "description": "You arrive to a clearing, you see a lighthouse to the north and there is a strange smell coming from the east",
        "escriptiones": "Llegas a otro claro, hay algunos trolls que asan carne misteriosa. Todavía no te han visto. ¿Qué haces?",   
        "directions": {
            "south": "start",
            "north": "lighthouse",
            "east": "trolls"
        }
    },
    "lighthouse": {
        "name": "light house",
        "description": "You arrive to the lighthouse and walk up to the door. A strange old ladyopens the door. What do you do?",
        "escriptiones": "Llegas a otro claro, hay algunos trolls que asan carne misteriosa. Todavía no te han visto. ¿Qué haces?",   
        "directions": {
            "south": "clearing1"
        }
    },
    "trolls": {
        "name": "clearing of troalls",
        "description": "You arrive to another clearing, there are some trolls roasting some mysterious meat They haven't seen you yet. What do you do?",
        "escriptiones": "Llegas a otro claro, hay algunos trolls que asan carne misteriosa. Todavía no te han visto. ¿Qué haces?",   
        "directions": {
            "west": "clearing1"
        }
    },
    "bridge1": {
        "name": "on a bridge",
        "description": "You see a river and there is a bridge to the west",
        "escriptiones": "Ves un río y hay un puente hacia el oeste",   
        "directions": {
            "east": "start",
            "west": "bridge2"
        }
    },
    "bridge2": {
        "name": "on a bridge",
        "description": "You try to cross the bridge but a troll jumps out and bites your leg!",
        "escriptiones": "¡Intentas cruzar el puente pero un troll salta y te muerde la pierna!",   
        "directions": {
            "east": "bridge1"
        }
    },
        "end": {
            "name": "the end",
            "description": "taa taa",
            "escriptiones": "el fin",   
            "directions": {
                "restart": "start"
            }

       
    }
  
}
