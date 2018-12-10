Fabricator(:product) do
  name  "MyString"
  price 100
  image File.open("#{Rails.root}/spec/fixtures/images/pikachu.png")
end
