# feature "Test Infrastructure"  do 
#   scenario "Go to homepage" do
#   	visit '/'
#   	expect(page).to have_content "Test Infrastructure Working!!!"
#   end	
# end

feature "Enter players' names" do
  scenario "Enter names" do
	visit '/'
	fill_in("p1", with: "Jimmy")
  fill_in("p2", with: "Lemonade")
	click_button("Submit")
	expect(page).to have_content "Jimmy vs Lemonade..."
  end
end