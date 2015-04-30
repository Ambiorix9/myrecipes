require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken parm", summary: "A delicious chicken dish", 
              description: "add chicken, add onion, add tomato sauce and cook for 20mins")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?  
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end  
  
  test "name should not be too short" do
    @recipe.name = "x"
    assert_not @recipe.valid?
  end  
  
  test "name should not be too long" do
    @recipe.name = "x" * 101  #this creates a string with 101 exes
    assert_not @recipe.valid?
  end
  
  test "summary should not be too short" do
    @recipe.summary = "x"
    assert_not @recipe.valid?
  end  
  
  test "summary should not be too long" do
    @recipe.summary = "x" * 200
    assert_not @recipe.valid?
  end    
  
  test "description should not be too short" do
    @recipe.description = "x"
    assert_not @recipe.valid?
  end  
  
  test "description should not be too long" do
    @recipe.description = "x" * 600
    assert_not @recipe.valid?
  end  
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
end