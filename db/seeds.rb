# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 PlannedDay.create({
     lunch: 3000,
     lunch: 4000,
     date: Date.today
 })
for i in 1..13 do
    # tmp = {
    #     lunch: 3000+i,
    #     dinner: 4000+i,
    #     date: Date.today+i,
    # }
    # if i == 3 || i == 10 || i == 11
    #     tmp['lunch'] = nil
    # elsif i == 13
    #     tmp['dinner'] = nil
    # end
    tmp = {
        lunch: nil,
        dinner: nil,
        date: Date.today+i,
    }
    day = PlannedDay.create(tmp)
end