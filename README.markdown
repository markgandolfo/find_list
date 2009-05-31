###FindByList

Little plugin that will return an array from an Active Record object ready to use in a select
By default it uses the 'id' as the value and 'name' as the display field.

###Example

To get all users
User.list

**If you want to select different fields for the list plugin to use, you can simply do**

User.list(:id => 'another_id_field', :display => 'firstname')


**Standard activerecord :conditions tags can also be used**

User.list(:conditions => { :active => 1 } )


**Or to put everything together**

User.list(:id => 'another_id_field', :display => 'firstname', :conditions => { :active => 1 })





####Copyright
Copyright (c) 2009 Mark Gandolfo, released under the MIT license
