if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)


#~ --------------------------------------- ТОВАРЫ --------------------------------------------------------------------------------------
p1 = Product.create!(title: 'Оперативная память для ноутбуков Kingston KVR13S9S8/4 SO-DIMM 4GB DDR3 1333MHz Retail', 
short_description: 'Код производителя: KVR13S9S8/4 Гарантия : 12 мес.', full_description: '
С необходимостью в увеличении объема оперативной памяти своего стационарного ПК или ноутбука рано 
или поздно сталкивается практически каждый пользователь. ', list_id_images: '1.jpg',
base_price: 1687.8, current_price: 2067, quantity_in_stock: 17, article: 170001, minimum_quantity: 1)

p2 = Product.create!(title: 'Принт-сервер TP-LINK TL-PS110U', 
short_description: 'Код производителя: TL-PS110U Гарантия : 12 мес.', full_description: '
Принт-сервер модели TP-LINK TL-PS110U – сетевое устройство, позволяющее 
подсоединить принтер к сети, у которого отсутствует сетевой порт.', list_id_images: '2.jpg',
base_price: 1907.7, current_price: 2350, quantity_in_stock: 300, article: 170002, minimum_quantity: 1)

p3 = Product.create!(title: 'Неттоп HP 260 G2 Intel Core i3-6100U 4Gb 500Gb Intel HD Graphics DOS черный X3K38ES', 
short_description: 'Код производителя: X3K38ES Гарантия : 12 мес.', full_description: '
Частота процессора: 2.3 Оперативная память: 4Gb 
Тип графического контроллера: Интегрированный 
Модель процессора: 6100U ', list_id_images: '3.jpg',
base_price: 20170.7, current_price: 20492, quantity_in_stock: 152, article: 170003, minimum_quantity: 1)

p4 = Product.create!(title: 'Процессор Intel® Core™ i5-7400 OEM', 
short_description: 'Код производителя: CM8067702867050 Гарантия : 12 мес.', full_description: '
Intel Core i5-7400 послужит идеальным приобретением для 
тех, кто захочет собрать себе многофункциональную 
рабочую или же добротную игровую станцию.', list_id_images: '4.jpg',
base_price: 12111, current_price: 12473, quantity_in_stock: 180, article: 170004, minimum_quantity: 1)

p5 = Product.create!(title: 'Коврик для мыши SVEN HC-01-03, черный, 300х225х1,5 мм, материал: микрофибра на прорезиненной основе', 
short_description: 'Код производителя: SV-009885 Гарантия : 12 мес.', full_description: '
Данное приспособление выполнено из ультрамягкой микрофибры, основа его прорезинена. 
Среди особенностей: стойкость к деформациям и повреждениям.', list_id_images: '5.jpg',
base_price: 207, current_price: 230, quantity_in_stock: 378, article: 170005, minimum_quantity: 1)

p6 = Product.create!(title: 'Беспроводной комплект Logitech Wireless and Mouse MK235 Grey', 
short_description: 'Код производителя: 920-007948 Гарантия : 12 мес.', full_description: '
Logitech Wireless Keyboard and Mouse MK235 Grey - это комплект беспроводной клавиатуры и мыши, который даст 
вам возможность управлять компьютером, не вставая с диваном.', list_id_images: '6.jpg',
base_price: 1400, current_price: 1500, quantity_in_stock: 153, article: 170006, minimum_quantity: 1)

p7 = Product.create!(title: 'Программное обеспечение Windows 10 Home 32/64 bit Rus Only USB (KW9-00253)', 
short_description: 'Код производителя: KW9-00253 Гарантия : 12 мес.', full_description: '
Программное обеспечение Windows 10 Home 32/64 bit Rus – пожалуй, одно из самых главных дополнительных 
приобретений для персонального компьютера или ноутбука. ', list_id_images: '7.jpg',
base_price: 6997, current_price: 7300, quantity_in_stock: 116, article: 170007, minimum_quantity: 1)



#~ -------------------------------------------- КЛИЕНТЫ ---------------------------------------------------------------------------------
c1 = Client.create!(name: 'Шейка Артем', phone: '+79775966339', address: 'ЛЕНИНГРАД', email: "zhizn_bol@qwe.com")

c2 = Client.create!(name: 'Шнягин Альберт Иванович', phone: '89485989996', 
address: 'Ленинградское ш., 16А, корп. 2', email: 'shnjagin@qwe.com')

c3 = Client.create!(name: 'Ладко Юлия', phone: '89894563211', address: '', email: 'ladko@qwe.com')

#~ -------------------------------------------- ЗАКАЗЫ ---------------------------------------------------------------------------------
o1 = Order.create!(client: c2, order_number: 10001, payment_method: 'Наличными при получении', delivery_method: 'Самовывоз = бесплатно',
list_products: '1)Принт-сервер TP-LINK TL-PS110U 
2)Программное обеспечение Windows 10 Home 32/64 bit Rus Only USB (KW9-00253)', 
cost_goods: 9650, total_cost: 9650, order_date: '2017-03-08')

o2 = Order.create!(client: c1, order_number: 10002, payment_method: 'Наличными при получении', delivery_method: 'Курьерская доставка = 250 рублей',
list_products: '1)Беспроводной комплект Logitech Wireless and Mouse MK235 Grey', cost_goods: 1500, total_cost: 1750, order_date: '2017-04-18')

o3 = Order.create!(client: c3, order_number: 10003, payment_method: 'Банковской картой', delivery_method: 'Постамат PickPoint = 150 рублей',
list_products: '1)Процессор Intel® Core™ i5-7400 OEM', cost_goods: 12473, total_cost: 12623, order_date: '2017-05-09')

#~ ---------------------------------------------- СПИСКИ -------------------------------------------------------------------------------
l1 = List.create!(product: p2, order: o1, quantity_at_order: 1)

l2 = List.create!(product: p6, order: o2, quantity_at_order: 1)

l2 = List.create!(product: p4, order: o3, quantity_at_order: 1)
