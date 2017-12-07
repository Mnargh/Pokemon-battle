# feature "Test Infrastructure"  do 
#   scenario "Go to homepage" do
#   	visit '/'
#   	expect(page).to have_content "Test Infrastructure Working!!!"
#   end	
# end

feature "Enter players' names" do
  scenario "Enter names" do
	  sign_in_and_play
	  expect(page).to have_content "Jimmy vs Lemonade..."
  end
end

feature "Show HP" do
  scenario "Look for HP on battle page" do
    sign_in_and_play
    expect(page).to have_content "Lemonade HP:100/100"
  end
end

feature "attacks" do
  scenario "player1 attacks player2" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Jimmy attacked Lemonade!"
  end
end
