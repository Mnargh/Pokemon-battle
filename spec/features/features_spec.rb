describe "Features" do
  feature "Enter players' names" do
    scenario "Enter names" do
  	  sign_in_and_play
  	  expect(page).to have_content "Jimmy vs Lemonade..."
    end
  end

  feature "Show HP" do
    scenario "Look for HP on battle page" do
      sign_in_and_play
      expect(page).to have_content "Lemonade HP: 100/100"
    end
  end

  feature "Shows whose turn it is" do
    scenario "It's Jimmy's turn!" do
      sign_in_and_play
      expect(page).to have_content "It's Jimmy's turn!"
    end
    scenario "It's Lemonade's turn!" do
      sign_in_and_play
      click_button("Attack Player 2!")
      expect(page).to have_content "It's Lemonade's turn!"
    end
  end

  feature "attacks" do
    scenario "Player 1 attacks Player 2" do
      sign_in_and_play
      click_button("Attack Player 2!")
      expect(page).to have_content "Jimmy attacked Lemonade!"
    end
    scenario "Attacking Player 2 takes hp from victim" do
      sign_in_and_play
      click_button("Attack Player 2!")
      expect(page).to have_content "Lemonade HP: 90/100"
    end
    scenario "Attacking Player 1 takes hp from victim" do
      sign_in_and_play
      click_button("Attack Player 1!")
      expect(page).to have_content "Jimmy HP: 90/100"
    end
  end

  feature "Winning and Losing" do
    scenario "Everyone attacks Jimmy!!(poor lad)" do
      sign_in_and_play
      10.times { click_button("Attack Player 1!")}
      expect(page).to have_content "Jimmy Loses!"
    end
  end
end
