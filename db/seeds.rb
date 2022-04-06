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


hive_modules = {
  "Cubes" => ["Add an Activity:  Needs Cleaning (Dirty flag)", "Add an Activity: Cube is Damaged (Damaged Flag)", "Assign a prepped cube lock", "Complete Activity (Dirty and Damaged)", "Enter combination number", "Filter Cubes", "Filter Map", "Move-out", "Pay from the Cube Detail Tab", "Print Cube lists", "Print Store Map", "Print Walk Through list", "Reserve", "Search for Cubes", "Sort Cubes", "Transfer", "View a Map", "View Cube Details", "View History", "View Ledger", "View Notes", "View Rental History of a Cube", "View Unit Groups", "Cubes Rates (Street, Rent)", "Cubes Statuses"],
  "Leads" => ["Close a lead",
    "Close a Reservation",
    "Close a waitlist lead",
    "Complete a task for a Lead",
    "Complete a Task for a Reservation",
    "Complete a task for Waitlist lead",
    "Confirm a Reservation",
    "Convert a lead to a reservation ",
    "Create a Lead:  Personal -Military",
    "Create a Lead:  Personal-Standard",
    "Create a Lead: Business Account",
    "Create a Lead: Personal- Student",
    "Create a Reservation:  Personal -Military",
    "Create a Reservation:  Personal-Standard",
    "Create a Reservation: Business Account",
    "Create a Reservation: Personal- Student",
    "Create a Waitlist lead:  Personal -Military",
    "Create a Waitlist lead:  Personal-Standard",
    "Create a Waitlist lead: Business Account",
    "Create a Waitlist lead: Personal- Student",
    "Filter list of leads",
    "Follow Up on a Lead : All Types",
    "Follow up on a reservation",
    "Follow up on a waitlist lead ",
    "Print list of leads",
    "Reservation becomes a Missed Move-in",
    "Reservation can be upgraded",
    "Schedule an Appointment",
    "Search list of Leads",
    "SmartRental Indicators ",
    "Sort list of leads",
    "Unit becomes available for a waitlist lead",
    "Update a Lead",
    "Update a Reservation",
    "Update a Waitlist Lead",
    "View List of Leads"],
  "Customers" => ["Add a Payment Method",
    "Add a Contact",
    "Add a Cube",
    "Add a Note",
    "Add a Phone Number ",
    "Add an Address",
    "Assign a Rental to a Payment Method",
    "Change Communication Preferences (VARIOUS)",
    "Delete a Payment Method",
    "Edit a Gate Time zone",
    "Edit Upcoming Charges",
    "email a document (send button)",
    "Filter Documents",
    "Filter History",
    "Mark a Contact as Alternate",
    "Mark a Phone Number as Primary",
    "Mark an Address as Primary",
    "Mark customer as Delinquency Exempt",
    "Mark customer as Tax Exempt",
    "Open an Email Body",
    "Remove a Contact",
    "Remove a Payment Method",
    "Remove a Phone Number ",
    "Remove an Address",
    "Resend the email",
    "Search Documents",
    "Send a Document",
    "Update a Contact",
    "update a document",
    "Update a Gate Code",
    "Update a Phone Number",
    "Update an Address",
    "Update Customer Information",
    "Update the email address",
    "Upload Document",
    "View a Single document PDF",
    "View Archived Payment Methods",
    "View Documents",
    "View History",
    "WebCam Photo (Admin Only)"
  ],
  "Rental" => ["Add a Service",
    "Add a Stored Vehicle",
    "Apply a Promotion",
    "Cancel a Service",
    "Cancel Private Insurance",
    "Cancel Store Insurance",
    "Complete a Delinquency Task",
    "Edit a Gate Code",
    "Edit a Scheduled Rate Change",
    "Edit a Stored Vehicle",
    "Edit the Billing Cycle Date",
    "Enroll (add) in Store Insurance",
    "Enroll in Private Insurance",
    "Exclude from a Rate Change",
    "Mark a Locked out",
    "Mark as Lock-out exempt",
    "Remove a Promotion",
    "Remove a Stored Vehicle",
    "Rental: Delinquency",
    "Rental: Ledger",
    "Schedule a Rate Change",
    "unexempt a lock out",
    "Un-Lock out"
  ], 
  "Billing" => ["Edit an Autopay",
    "Email a Bill",
    "Email a Receipt",
    "Filter Failed AutoPay's",
    "Filter payments",
    "Print a Bill",
    "Print a Receipt",
    "Remove Fail Autopay task",
    "Rerun an Autopay",
    "Search for a payment",
    "Search for an autopay",
    "Sort Payments",
    "View Failed AutoPay's",
    "View list of Payments",
    "View Payment Derails",
    "View Payment Details",
    "View Sent Bills",
    "Sent Bills",
    "Unsent Bills",
    "Invoice Concept",
    "Finalize Invoice",
    "Void Invoice"
  ],
  "Financial" => ["Abacus (Nightly Processing)",
    "Abacus Process",
    "Critical Reports (AB, AA, GL, Insured Tenants, Cube Dep, etc... ",
    "Daily Accrual",
    "GL Out Of Balance Validations",
    "Kepler Data",
    "Monthly Process",
    "QlikView / Flash Reports",
    "Revenue Model"
  ],
  "Transactions" => [
    "Ledger Adjustments:  Add Insurance",
    "Ledger Adjustments:  Change a Rent Rate",
    "Ledger Adjustments:  Remove Insurance",
    "Ledger Adjustments: Add a Fee",
    "Ledger Adjustments: Apply Promotion",
    "Ledger Adjustments: Issue Credit",
    "Ledger Adjustments: Remove a Promotion",
    "Ledger Adjustments: Void a Credit",
    "Ledger Adjustments: Waive a Fee",
    "Move In: Business Customer",
    "Move In: Customer with Vehicle",
    "Move In: Military Customer",
    "Move In: Regular Customer",
    "Move Out: No Balance Owed",
    "Move Out: Prepaid (Refund)",
    "Move Out: Through Auction Manager",
    "Move Out: With a balance",
    "Payment  Prepay",
    "Payment : Partial Pay",
    "Payment Integration:  Customer Center",
    "Payment Integration:  Mobile App",
    "Payment Integration:  Phone Payment (Epic Connections/Incontact)",
    "Payment Reversal: chargeback",
    "Payment Reversal: NSF",
    "Payment Reversal: Refund",
    "Payment Reversal: Void",
    "Payment Security Deposit",
    "Payment Types: ACH/eCheck",
    "Payment Types: cash",
    "Payment Types: check",
    "Payment Types: credit card (EMV)",
    "Payment Types: credit card (manually keyed into device)",
    "Payment Types: Money Order",
    "Payment: Autopay",
    "Payment: Autopay Rerun",
    "Payment: Balance Due",
    "Payment: Misc. Revenue",
    "Payment: No Balance Due",
    "Payment: Retail",
    "Schedule a Move-out",
    "Schedule a Transfer",
    "Transfer: to less expensive unit",
    "Transfer: to more expensive unit",
    "Transfer: to same price unit"
  ],
  "Past Due" => [
    "Assign a Cube to an Auction (Reassign a cube to Auction)",
    "Cancel an Auction",
    "CoM Batch Mailing",
    "Complete Past Due Tasks in mass",
    "Create an Auction",
    "Filter Past Due Customers",
    "Move-out a cube through the Auction",
    "Process a Cube through an Auction",
    "Remove a Cube from an Auction",
    "Sort Past Due Customers",
    "View Past Auctions",
    "View Past Due Customers",
    "View Previously Past Due Customers"
  ],
  "Communications" => ["Create a Print Batch",
    "Edit and Email",
    "Filter Mailed Letters",
    "Initiate/Respond to  an SMS",
    "Mail a Batch of Adhoc letters",
    "Open an Email",
    "Open an SMS",
    "Print a Print Batch",
    "Print a template",
    "Print USPS 3665 Form",
    "Resend an Email",
    "Resend an Esign Email Attempt",
    "Search for a Mailed Letter",
    "Sign an esignable Document",
    "Sort mailed Letters",
    "Track a Certified Letter",
    "View a Print Batch",
    "View an Email Body",
    "View list of eSigned Documents",
    "View Mailed letters",
    "View the Signed USPS Receipt of Delivery for a Certified Letter"
  ],
  "Nightly Processing" => ["All the other nightly processing stuff we don’t know (Storable)",
    "Apply Delinquency Schedule",
    "Apply late fees",
    "Generate Emails",
    "Generate GL's",
    "Generate Rollups",
    "Generate Tasks",
    "Generate/Post Assessments",
    "Mail Letters (Integration with Mailhouse)",
    "Process AutoPay",
    "Process Customer Rate Changes (inc. and dec.)",
    "Update Delinquency"
  ],
  "Cases" => ["Close a Case",
    "Follow Up on a Case"
  ]
 
}
hive_modules.each do |key, value| 
  h_module = HiveModule.find_or_create_by(name: key)
  value.each do |sub_function|
    HiveModuleSubfunction.find_or_create_by(name: sub_function, hive_module_id: h_module&.id)
  end
end