module RhymeHelper
  def rhyme_uuid(uuid)
    case last = uuid.slice(-1)
    when '0'  then "Sword and sorcery, villain and hero,"
    when '1'  then "Who said the waiting wasn't the fun,"
    when '2'  then "Maybe this will be the story they tell about you"
    when '3'  then "By the light that's sliced through the branches of a tree,"
    when '4'  then "The mouths that feed first are the mouths that need more,"
    when '5'  then "If we really are lucky we'll get out of this alive,"
    when '6'  then "With leaves and mushrooms and flowers and sticks,"
    when '7'  then "By the light of the stars a half past eleven,"
    when '8'  then "The creaking of trees when the wind won't abate,"
    when '9'  then "The wind keeps the sand from holding a line,"
    when 'a' then "The treasures of life too airy to weigh,"
    when 'b' then "Hey look, it's a bumblebee,"
    when 'c' then "May none of our friends be swept out to sea,"
    when 'd' then "When the howling of the wind wails like a banshee,"
    when 'e' then "We swirl 'um and soak 'um and make 'um into tea,"
    when 'f' then "In the voices of friends beside a treble clef,"
    end
  end
end
