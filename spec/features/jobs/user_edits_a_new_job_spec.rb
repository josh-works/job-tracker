require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do

  company = Company.create!(name: "ESPN")
  job = company.jobs.create!(title: "Dev Ninja",
                            description: "So fun!",
                            level_of_interest: 80,
                            city: "Denver")

  visit company_path(company)
  expect(page).to have_content "Dev Ninja"
  expect(page).to have_link job.title, href: edit_job_path(job)
  click_on job.title
  fill_in "job[title]", with: "Dev Pirate"
  click_on "Update Job"

  expect(page).to have_content "Dev Pirate"



  end
end
# describe "User creates a new job" do
#   scenario "a user can create a new job" do
#     company = Company.create!(name: "ESPN")
#     visit new_company_job_path(company)
#
#     fill_in "job[title]", with: "Developer"
#     fill_in "job[description]", with: "So fun!"
#     fill_in "job[level_of_interest]", with: 80
#     fill_in "job[city]", with: "Denver"
#
#     click_button "Create"
#
#     expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
#     expect(page).to have_content("ESPN")
#     expect(page).to have_content("Developer")
#     expect(page).to have_content("80")
#     expect(page).to have_content("Denver")
#   end
# end
