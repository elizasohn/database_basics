require 'spec_helper'

describe '#Project' do
    describe('#==') do
      it("is the same project if it has the same attributes as another project") do
        project = Project.new({:name => "Pulling Ivy", :id => nil})
        project.save()
        project2 = Project.new({:name => "Pulling Ivy", :id => nil})
        project.save()
        expect(project).to(eq(project2))
      end
    end

    describe(".all") do
      it("returns an empty array when there are no projects") do
        expect(Project.all()).to(eq([]))
      end
    end

    # describe('#save') do
    #   it("saves an project") do
    #     project = Project.new({:name => "Dr. Seuss", :id => nil}) # nil added as second argument
    #     project.save()
    #     project2 = Project.new({:name => "John Redfield", :id => nil}) # nil added as second argument
    #     project2.save()
    #     expect(Project.all).to(eq([project, project2]))
    #   end
    # end
    #
    # describe('.clear') do
    #   it("clears all projects") do
    #     projects = Project.new({:name => "Dr. Seuss", :id => nil})
    #     projects.save()
    #     projects2 = Project.new({:name => "John Redfield", :id => nil})
    #     projects2.save()
    #     Project.clear()
    #     expect(Project.all).to(eq([]))
    #   end
    # end
    #
    # describe('.find') do
    #   it("finds an project by id") do
    #     project = Project.new({:name => "Lorrie Moore", :id => nil})
    #     project.save()
    #     project2 = Project.new({:name => "Amy Hempel", :id => nil})
    #     project2.save()
    #     expect(Project.find(project.id)).to(eq(project))
    #   end
    # end
    #
    # describe('#update') do
    #   it("updates an project by id") do
    #     project = Project.new({:name => "Kurt Vonnegut", :id => nil})
    #     project.save()
    #     project.update("Mr. Kurt Vonnegut")
    #     expect(project.name).to(eq("Mr. Kurt Vonnegut"))
    #   end
    # end
    #
    # describe('#delete') do
    #   it("deletes an project by id") do
    #     project = Project.new({:name => "Herman Melville", :id => nil})
    #     project.save()
    #     project2 = Project.new({:name => "Sylvia Plath", :id => nil})
    #     project2.save()
    #     project.delete()
    #     expect(Project.all).to(eq([project2]))
    #   end
    # end
    #
    # describe('.search') do
    #   it("Searches for matching projects by name") do
    #     project1 = Project.new({:name => "Gabriel Garcia Marquez", :id => nil})
    #     project1.save()
    #     project2 = Project.new({:name => "Vladimir Nabokov", :id => nil})
    #     project2.save()
    #     project3 = Project.new({:name => "Milan Kundera", :id => nil})
    #     project3.save()
    #
    #     expect(Project.search("Milan")).to(eq([project3]))
    #   end
    # end

    # describe('.sort') do
    #   it('sorts by alphebetical order') do
    #     project1 = Project.new({:name => "Pablo Neruda", :id => nil})
    #     project1.save()
    #     project2 = Project.new({:name => "E. E. Cummings", :id => nil})
    #     project2.save()
    #     project3 = Project.new({:name => "Robert Asimov", :id => nil})
    #     project3.save()
    #     expect(Project.sort()).to(eq([project2, project1, project3]))
    #   end
    # end

    # describe('#songs') do
    #   it("returns an album's songs") do
    #     album = Album.new({:name => "Giant Steps", :id => nil})
    #     album.save()
    #     song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
    #     song.save()
    #     song2 = Song.new({:name => "Cousin Mary", :album_id => album.id, :id => nil})
    #     song2.save()
    #     expect(album.songs).to(eq([song, song2]))
    #   end
    # end
end
