var currentRoom = "start";
var commands = ["go", "pickup", "inventory", "talk"];
var inventory = ["sword", "shield"];

function changeRoom(dir) {
    if (rooms[currentRoom].directions[dir] !== undefined) {
        currentRoom = rooms[currentRoom].directions[dir]
        $('#game-text').append("<p>" + rooms[currentRoom].description + "</p>");
        $('#game-textes').append("<p>" + rooms[currentRoom].escriptiones + "</p>");
        say(rooms[currentRoom].name);
        say(rooms[currentRoom].escriptiones);
    } else {
        $('#game-text').append("<p>You cannot go that way!</p>");
        say("You cannot go that way!");
    }


}

function showHelp() {
    $('#game-text').append("<p>Here are the possible commands: </p>");
    $('#game-text').append("<p><ul>");
    for (var i = 0; i < commands.length; i++) {
        $('#game-text').append("<li>" + commands[i] + "</li>");
        say(commands[i])
    }
    $('#game-text').append("</ul></p>");

}

function showInventory() {
    if (inventory.length === 0) {
        $('#game-text').append("You are not carrying anything!");
        return;
    }
    $('#game-text').append("<p>Here is your inventory: </p>");
    $('#game-text').append("<p><ul>");
    for (var i = 0; i < inventory.length; i++) {
        $('#game-text').append("<li>" + inventory[i] + "</li>");
        say(inventory[i])
    }
    $('#game-text').append("</ul></p>");

}

function playerInput(input) {
    var command = input.split(" ")[0];
    switch (command) {
        case "go":
            var dir = input.split(" ")[1];
            changeRoom(dir);
            break;
        case "help":
              //  createjs.Sound.play("ambiance");
            showHelp();
            break;
        case "inventory":
            showInventory();
            break;
        case "look":
            say(rooms[currentRoom].name);
            say(rooms[currentRoom].escriptiones) ;          
            break;
        case "l":
            say(rooms[currentRoom].name);
            say(rooms[currentRoom].escriptiones) ;          
            break;
        default:
                createjs.Sound.play("error");
            $('#game-text').append("<p>Invalid command!</p>");
    }
}
function loadHandler(event) {
    // This is fired for each sound that is registered.
    var instance = createjs.Sound.play("error");  // play using id.  Could also use full sourcepath or event.src.
    instance.on("complete", this.handleComplete, this);
    instance.volume = 0.5;
}

function handleLoadComplete(event) {
    var props = new createjs.PlayPropsConfig().set({interrupt: createjs.Sound.INTERRUPT_ANY, loop: -1, volume: 0.5})
  // createjs.Sound.play("ambiance", props);
}

function say(m) {
    var msg = new SpeechSynthesisUtterance();
    var voices = window.speechSynthesis.getVoices();
    msg.voice = voices[3];
    msg.voiceURI = "native";
    msg.volume = 1;
    msg.rate = 0.7;
    msg.pitch = 0.9;
    msg.text = m;
    msg.lang = 'es-MX';
    speechSynthesis.speak(msg);
  }

$(document).ready(function() {
    createjs.Sound.on("fileload", handleLoadComplete);
    createjs.Sound.alternateExtensions = ["mp3"];
    createjs.Sound.registerSound({src:"/ambiance.ogg", id:"ambiance"});
    createjs.Sound.registerSound({src:"/error.ogg", id:"error"});

    $('#game-textes').append("<p>" + rooms.start.description + "</p>");
    $('#game-text').append("<p>"  + rooms.start.escriptiones + "</p>");
    say(rooms.start.escriptiones);

    $(document).keypress(function(key) {
        if (key.which === 13 && $('#user-input').is(':focus')) {
            var value = $('#user-input').val().toLowerCase();
            $('#user-input').val("");
            playerInput(value);
        }
    })


})
