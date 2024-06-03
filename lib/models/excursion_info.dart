class excursionInfo {
  String name;
  String time;
  String price;
  String info1;
  String info2;
  String info3;
  String person_count;
  String image_link;
  List images;
   
  excursionInfo({
    required this.name,
    required this.time,
    required this.price,
    required this.info1,
    required this.info2,
    required this.info3,
    required this.person_count,
    required this.image_link,
    required this.images

  });
}
List<excursionInfo> excursions = [
  excursionInfo(
    name: 'Интерактивная экскурсия "Волшебное стекло" в Стеклодувную Мастерскую!', 
    time: '4 часа', 
    price: 'Для группы 20+2 1560 руб/чел\nДля группы 30+3 1320 руб/чел\nДля группы 40+4 1260 руб/чел', 
    info1: 'Вы побываете на настоящем производстве в стеклодувной мастерской!', 
    info2: 'Узнаете, как из капли стекла можно сделать изделия различной величины, подержите в руках инструменты стеклодува, познакомитесь с уникальным ремеслом и искусством выдувания стекла.', 
    info3: 'И еще вы получите в подарок бусину ручной работы из знаменитого во всем мире муранского стекла.', 
    person_count:'',
    image_link: 'assets/images/e1.png' ,
    images : ['assets/images/e.1.1.png','assets/images/e.1.2.png','assets/images/e.1.3.png','assets/images/e.1.4.png','assets/images/e.1.5.png','assets/images/e.1.6.jpg']
  ),
  excursionInfo(
    name: 'Сказочный трамвай - экскурсия по новогоднему Екатеринбургу со Снегурочкой!', 
    time: '1,5 часа', 
    price:'14 500 руб', 
    info1: 'Вы прокатитесь на настоящем сказочном трамвае!', 
    info2: 'Основной экскурсовод расскажет о самом празднике Новый Год, о том как праздновали его на Руси раньше, как празднуют сейчас, как и когда празднуют Новый год в других странах.', 
    info3: 'А Снегурочка расскажет о том как писать письмо Деду Морозу, как украшать елочку и проведет забавные игры и конкурсы.', 
    person_count: 'Группа до 30 чел.',
    image_link: 'assets/images/e2.png',
    images : ['assets/images/e2.png']
  ),
  excursionInfo(
    name: 'Обзорная экскурсия по Екатеринбургу с посещением Свердловской киностудии', 
    time: '4 часа', 
    price: 'Для группы 20+2 1150 руб/чел\nДля группы 30+3 900 руб/чел\nДля группы 40+4 850 руб/чел', 
    info1: 'Приглашаем Вас на обзорную экскурсию по Екатеринбургу с посещением нашей знаменитой Свердловской киностудии (посещение 1 цеха).', 
    info2: 'Свердловская киностудия - это увлекательное путешествие, особенность которого в том, что Вы увидите только естественные и настоящие экспонаты и декорации, рабочие цеха и съёмочные павильоны. Вы посетите один из цехов киностудии, например, костюмерно-реквизиторский, где узнаете об истории, видах и специфике костюмов в кино. Конечно же, костюмы можно примерить и сделать фото!', 
    info3: '', 
    person_count: '',
    image_link: 'assets/images/e3.png',
    images : ['assets/images/e.3.1.jpg','assets/images/e.3.2.jpg','assets/images/e.3.3.jpg','assets/images/e.3.4.jpg','assets/images/e.3.5.jpg','assets/images/e.3.6.jpg']

    )
];