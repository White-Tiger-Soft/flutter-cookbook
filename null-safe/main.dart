void main() {
  // В Dart любая переменная, константа или результат выполнения функции могут быть равны null. 
  // И взаимодействие с null объектом может привести к ошибке.
  String text;
  nonsafePrint(text);
  
  // Простейщий способ обезопасить код от null объекта - проверить его на равенство null:
  text = "HelloWorld";
  if (text != null) {    
    nonsafePrint(text);
  }
  
  // Еще один способ - использовать оператор if-null '??'
  text = null;
  nonsafePrint(text ?? "Default text");
  
  // Но это не сработает при получении доступа к элементам по цепочке, если в цепочке появляется null объект:
  Cat cat; 
  try {    
    nonsafePrint(cat.name ?? "Barsik");
  } catch(e) {
    print(e);
  }
  
  // В этом случае используется условный доступ к элементам '?.'
  nonsafePrint(cat?.name ?? "Barsik");
  
}

void nonsafePrint(String text) {
  try {    
    print('"$text".length: ${text.length}');
  } catch(e) {
    print(e);
  }
}

class Cat {
  String name;
  
  Cat({this.name});
}
