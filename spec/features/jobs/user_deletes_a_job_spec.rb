require 'rails_helper'

describe "User deletes an existing job" do
  scenario "a user can delete a job" do

  company = Company.create!(name: "ESPN")
  job = company.jobs.create!(title: "Dev Ninja",
                            description: "So fun!",
                            level_of_interest: 80,
                            city: "Denver")

  visit company_path(company)
  expect(page).to have_content job.title
  expect(page).to have_link "Delete", href: job_path(job)
  click_on "Delete"

  expect(page).to have_content "#{job.title} was successfully deleted!"

  end
end
