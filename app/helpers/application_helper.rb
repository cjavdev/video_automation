module ApplicationHelper
  def top_nav
    [
      {
        name: 'Videos',
        path: root_path
      },
      {
        name: 'Templates',
        path: description_templates_path
      },
      {
        name: 'Categories',
        path: categories_path
      },
      {
        name: 'Presenters',
        path: presenters_path
      },
    ]
  end
end
