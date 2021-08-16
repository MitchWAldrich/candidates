require 'active_support/all'
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    if id == candidate[:id]
      candidate
    end
  end
  nil
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    true
  else 
    false 
  end
end

def gitHubPoints?(candidate)
  if candidate[:github_points] >= 100
    true
  else
    false
  end
end

def recentApplication?(candidate)
  if (Date.today - candidate[:date_applied]).to_i <= 15
    true
  else
    false
  end
end

def age?(candidate)
  if candidate[:age] >= 18
    true
  else
    false
  end
end

def languageKnown?(candidate)
  candidate[:languages].each do |language|
    if language == "Python" || language == "Ruby"
      return true
    end
  end
  false
end

public :experienced?
public :gitHubPoints?
public :recentApplication?
public :languageKnown?
public :age?

def qualified_candidates(candidates)
  qualified_candidates_array = []

  candidates.each do |candidate|
    if candidate.experienced?(candidate) && candidate.gitHubPoints?(candidate) && candidate.recentApplication?(candidate) && candidate.languageKnown?(candidate) && candidate.age?(candidate)
      qualified_candidates_array.push(candidate)
    end
  end

  qualified_candidates_array     
end

def ordered_by_qualifications(candidates)
  
  experiencedCandidates = candidates.sort {|a, b| (a[:years_of_experience] == b[:years_of_experience]) ? a[:github_points] <=> b[:github_points] : a[:years_of_experience] <=> b[:years_of_experience]}.reverse

end


