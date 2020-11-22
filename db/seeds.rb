# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# First goes with comp models -> competencies -> behavioral markers
Storyline.destroy_all
CompetencyModel.destroy_all
Center.destroy_all


comp_model = CompetencyModel.create(name: 'Roche')
comps = []
['strategic agility', 'collaboration', 'inpiring and influencing'].each do |c|
  comps << Competency.create(name: c, competency_model: comp_model)
end

comps.each do |c|
  BehavioralMarker.create(marker: 'whatever this could be a very nice behavior',
                          competency: c)
end
# Then story lines -> exercises

storyline = Storyline.create(name: 'the hersic turmoil')

['Prepared Presentation', 'Conflict Resolution', 'Employee Conversation'].each do |ex|
  Exercise.create(name: ex, storyline: storyline)
end


center = Center.create(competency_model: comp_model, storyline: storyline)
