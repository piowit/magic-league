Trestle.resource(:leagues) do
  menu do
    item :leagues, icon: "fa fa-star"
  end

  table do
    column :name
    column :description
    column :start_date, align: :center
    column :end_date, align: :center
    column :created_at, align: :center
    column :updated_at, align: :center
    actions
  end

  form do |league|
    text_field :name
    text_field :description

    row do
      col { datetime_field :start_date }
      col { datetime_field :end_date }
    end
  end
end
