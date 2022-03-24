# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ui_element_categories = UiElementCategory.create([{ category_name: 'Input Controls' },
#   { category_name: 'Navigational Components' },
#   { category_name: 'Informational Components' },
#   { category_name: 'Containers' },
#   { category_name: 'Graphs & Charts' },
#   { category_name: 'Editors' }
#   ])
#   #   Character.create(name: 'Luke', movie: movies.first)
#--------Seeding UI Element Categories ---------------
ui_element_categories = ['Input Controls', 'Navigational Components', 'Informational Components', 'Containers', 'Graphs & Charts', 'Editors' ]
ui_element_categories.each do |category|
  UiElementCategory.find_or_create_by(category_name: category)
end
#--------Seeding UI Elements under Input Controls ---------------
input_controls = {
  "Checkbox" => "Checkboxes allow the user to select one or more options from a set.  It is usually best to present checkboxes in a vertical list. More than one column is acceptable as well if the list is long enough that it might require scrolling or if comparison of terms might be necessary.",
  "Radio button" => "Radio buttons are used to allow users to select one item at a time.",
  "Dropdown list" => "Dropdown lists allow users to select one item at a time, similarly to radio buttons, but are more compact allowing you to save space. Consider adding text to the field, such as ‘Select one’ to help the user recognize the necessary action.",
  "List box" => "List boxes, like checkboxes, allow users to select a multiple items at a time,but are more compact and can support a longer list of options if needed.",
  "Button" => "A button indicates an action upon touch and is typically labeled using text, an icon, or both.",
  "Dropdown Button" => "The dropdown button consists of a button that when clicked displays a drop-down list of mutually exclusive items.",
  "Toggle" =>"A toggle button allows the user to change a setting between two states. They are most effective when the on/off states are visually distinct.",
  "Text field" => "Text fields allow users to enter text.  It can allow either a single line or multiple lines of text.",
  "Date and time picker" => "This jquery plugins which are widely used for create calendar and date time pickers interfaces"
}
input_controls.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: UiElementCategory.first.id)
end
#--------Seeding UI Elements under Navigational Components category ---------------
navigational_components = {
  "Search Field"=> "Search text field where user can type and search designed data on the system",
  "Breadcrumb" => "Indicates the trail of the pages",
  "Pagination" => "Helps user to navigate through data records",
  "Tag" =>	"Tags allow users to find content in the same category.  Some tagging systems also allow users to apply their own tags to content by entering them into the system.",
  "Slider" =>	"A slider, also known as a track bar, allows users to set or adjust a value.  When the user changes the value, it does not change the format of the interface or other info on the screen.",
  "Icon" =>	"An icon is a simplified image serving as an intuitive symbol that is used to help users to navigate the system.  Typically, icons are hyperlinked.",
  "Image Carousel" =>	"Image carousels allow users to browse through a set of items and make a selection of one if they so choose. Typically, the images are hyperlinked.",
  "Nav bar" =>	"Image carousels allow users to browse through a set of items and make a selection of one if they so choose. Typically, the images are hyperlinked.",
  "Grid" => "The elements are used to divide the page in various sub-sections"
}
nc_category = UiElementCategory.where("category_name": "Navigational Components").first
navigational_components.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: nc_category.id)
end
#--------Seeding UI Elements under Informational Components category ---------------
ics = {
  "Notification" => "A notification is an update message that announces something new for the user to see. Notifications are typically used to indicate items such as, the successful completion of a task, or an error or warning message.",
  "Progress Bar" => "A progress bar indicates where a user is as they advance through a series of steps in a process. Typically, progress bars are not clickable.",
  "Popover" => "A tooltip allows a user to see hints when they hover over an item indicating the name or purpose of the item.",
  "Message Box" => "A message box is a small window that provides information to users and requires them to take an action before they can move forward.",
  "Modal Window (pop-up)" => "A modal window requires users to interact with it in some way before they can return to the system.",
  "Alerts" => "An element that displays any kind of mandatory message which can be categorized into a warning & contextual alternatives like error, success or information"
}
ic_category = UiElementCategory.where("category_name": "Informational Components").first
ics.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: ic_category.id)
end
#--------Seeding UI Elements under Containers Controls ---------------
containers = {
  "Accordion	" =>	"An accordion is a vertically stacked list of items that utilizes show/ hide functionality.  When a label is clicked, it expands the section showing the content within. There can have one or more items showing at a time and may have default states that reveal one or more sections without the user clicking",
  "Table" =>	"The element represents tabular data — that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data."
}
containers_category = UiElementCategory.where("category_name": "Containers").first
containers.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: containers_category.id)
end
#--------Seeding UI Elements under Charts category ---------------
charts = {"Pie Chart"	=> "A pie chart is a circular chart divided into sectors which is proportional to the quantity it represents."}
charts_category = UiElementCategory.where("category_name": "Graphs & Charts").first
charts.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: charts_category.id)
end
#--------Seeding UI Elements under Editors category ---------------
editors = {"Ckeditor"	=> "Modern JavaScript rich text editor"}
editors_category = UiElementCategory.where("category_name": "Editors").first
editors.each do |key, value|
  UiElement.find_or_create_by(element_name: key, element_discription: value, ui_element_category_id: editors_category.id)
end
#--------Seeding Users ---------------
hive_users = %w[adalvi@cubesmart.com vrakshe@cubesmart.com gpatel@cubesmart.com rkeeley@cubesmart.com djogi@cubesmart.com rtrivedi@cubesmart.com kjagtap@cubesmart.com smallela@cubesmart.com]
hive_users.each do |email|
  user = User.new(email: email, password: 'test1234', password_confirmation: 'test1234')
  user.save
end