FactoryGirl.define do

  factory :job do
    sequence(:company) { |n| "Company #{n}" }
    sequence(:position) { |n| "Software Developer #{n}" }
    sequence(:description) { |n| "We want an awesome dev to join our team and build cool stuff!" }
    sequence(:skills) do |n|
      {
        required: [
          "Necessary skill #{n}",
          "Necessary skill #{n + 1}",
          "Necessary skill #{n + 2}"
        ],
        recommended: [
          "Nice-to-have #{n}",
          "Nice-to-have #{n + 1}",
          "Nice-to-have #{n + 2}"
        ],
        years_experience: n * 2,
        education: "Bachelor's degree"
      }
    end
    # sequence(:perks) do |n|
    #   [
    #     "Job perk {n}",
    #     "Job perk {n + 1}",
    #     "Job perk {n + 2}"
    #   ]
    # end
    sequence(:date_posted) { |n| n.days.ago }
  end

end