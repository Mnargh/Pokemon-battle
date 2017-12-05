feature "Test Infrastructure"  do 
  scenario "Go to homepage" do
  	visit '/'
  	expect(page).to have_content "Test Infrastructure Working!!!"
  end	
end