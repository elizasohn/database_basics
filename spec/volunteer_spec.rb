require "spec_helper"

describe Volunteer do

  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.name).to eq 'Jane'
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(test_volunteer.project_id).to eq 1
    end
  end

  describe '#==' do
    it 'checks for equality based on the name of a volunteer' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      expect(volunteer1 == volunteer2).to eq true
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Volunteer.all).to eq []
    end

    it 'returns all volunteers' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.all).to eq [volunteer1, volunteer2]
    end
  end

  describe '#save' do
    it 'adds a volunteer to the database' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      expect(Volunteer.all).to eq [volunteer1]
    end
  end

  describe '.find' do
    it 'returns a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to eq volunteer1
    end
  end

  describe('.clear') do
    it("clears all volunteers") do
      volunteers = Volunteer.new({:name => "Eliza Sohn", :project_id => 1, :id => nil})
      volunteers.save()
      volunteers2 = Volunteer.new({:name => "Jean Baudrillard", :project_id => 2, :id => nil})
      volunteers2.save()
      Volunteer.clear()
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates an volunteer by name") do
      volunteer = Volunteer.new({:name => "Eliza Sohn", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer.update("Womb Service")
      expect(volunteer.name).to(eq("Womb Service"))
    end
  end

  describe('#delete') do
    it("deletes an volunteer by id") do
      volunteer = Volunteer.new({:name => "Eliza Sohn", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => "Michel Foucault", :project_id => 1, :id => nil})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all).to(eq([volunteer2]))
    end
  end

  describe('.search') do
    it("Searches for matching volunteers by name") do
      volunteer1 = Volunteer.new({:name => "Eliza Sohn", :project_id => 1, :id => nil})
      volunteer1.save()
      volunteer2 = Volunteer.new({:name => "Michel Foucault", :project_id => 1, :id => nil})
      volunteer2.save()
      volunteer3 = Volunteer.new({:name => "Slavoj Zsizek", :project_id => 1, :id => nil})
      volunteer3.save()
      expect(Volunteer.search("Eliza")).to(eq([volunteer1]))
    end
  end

  describe('.sort') do
    it('sorts by alphebetical order') do
      volunteer1 = Volunteer.new({:name => "Eliza Sohn", :project_id => 1, :id => nil})
      volunteer1.save()
      volunteer2 = Volunteer.new({:name => "Michel Foucault", :project_id => 1, :id => nil})
      volunteer2.save()
      volunteer3 = Volunteer.new({:name => "Jean Baudrillard", :project_id => 1, :id => nil})
      volunteer3.save()
      expect(Volunteer.sort()).to(eq([volunteer1, volunteer3, volunteer2]))
    end
  end


end



#     describe('#find_by_project') do
#       it("returns a project's volunteers") do
#         project = Project.new({:name => "Pulling Ivy", :id => nil})
#         project.save()
#         volunteer1 = Volunteer.new({:name => "Eliza Sohn", :project_id => project.id, :id => nil})
#         volunteer1.save()
#         volunteer2 = Volunteer.new({:name => "Michel Foucault", :project_id => project.id, :id => nil})
#         volunteer2.save()
#         expect.find_by_project).to(eq([volunteer1, volunteer2]))
#       end
#     end
# #
#     describe('#songs') do
#       it("returns an album's songs") do
#         album = Album.new({:name => "Giant Steps", :id => nil})
#         album.save()
#         song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
#         song.save()
#         song2 = Song.new({:name => "Cousin Mary", :album_id => album.id, :id => nil})
#         song2.save()
#         expect(album.songs).to(eq([song, song2]))
#       end
#     end
# end
