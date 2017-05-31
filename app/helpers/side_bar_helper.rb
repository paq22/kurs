module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Главная страница',
      :controller => :welcome, 
      :action => :index
    }
    items = []
    items << {:name => 'Товары',
       :controller => :products, :action => :index,
       :icon => 'gears',
       :class => 'long'}
    items << {:name => 'Заказы',
       :controller => :orders, :action => :index,
       :icon => 'shopping-basket',
       :class => 'long'}
    items << {:name => 'Списки',
       :controller => :lists, :action => :index,
       :icon => 'sticky-note-o',
       :class => 'long'} if is_admin?
    items << {:name => 'Клиенты',
       :controller => :clients, :action => :index,
       :icon => 'id-card-o',
       :class => 'long'} if is_admin?
    result << {
      :name => 'Таблицы',
      :icon => 'list',
      :children => items
    }
    if @current_role_user
      if @current_role_user.role.name == "admin"
       result << {
        :name => 'Администрирование',
        :icon => 'users',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'users',
         :class => 'long'},
        {:name => 'Добавление',
         :controller => :users, :action => :new,
         :icon => 'user-plus'},
        {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'align-center',
         :class => 'long'},
      ]}
      end
    end
    result << {
      :name => 'Поиск',
      :icon => 'search-plus',
      :children => [
      {:name => 'Поиск заказов',
       :controller => :orders, :action => :search,
       :icon => 'search',
       :class => 'long'}
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
