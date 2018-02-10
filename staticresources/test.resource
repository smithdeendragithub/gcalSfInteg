{!REQUIRESCRIPT("/soap/ajax/30.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/34/apex.js")}
{!REQUIRESCRIPT("/support/console/38.0/integration.js")}

function sayHelloFromAnotherJS()
{

alert('Hello World! - Static resources');
alert('sforce.console.isInConsole() : '+sforce.console.isInConsole());

}
