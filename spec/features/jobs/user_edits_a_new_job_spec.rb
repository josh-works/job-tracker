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
