require 'spec_helper'

describe MoviesController do
  describe 'going to the edit page for an existing movie' do
    before :each do
      @fake_result = mock('Movie')
    end
    it 'should call the model method that find the movie' do
      Movie.should_receive(:find).with('123').
        and_return(@fake_result)
      get :edit, {:id => 123}
    end
    it 'should select Edit Movie template for rendering' do
      Movie.stub(:find).and_return(@fake_result)
      get :edit, {:id => 123}
      response.should render_template('edit')
    end
    it 'should make the movie info available to that template' do
      Movie.stub(:find).and_return(@fake_result)
      get :edit, {:id => 123}
      assigns(:movie).should == @fake_result
    end
  end
=begin
  describe 'adding a director to an existing movie' do
    before :each do
      @fake_result = [mock('movie1')]
    end
    it 'should call the model method that finds the movie' do
      Movie.should_receive(:find).with('123').
        and_return(@fake_result)
      @fake_result.stub(:update_attributes!)
      put :update, {:id => 123,
                    :movie=> {"title"=>"Test Movie", 
                              "rating"=>"R",
                              "release_date(1i)"=>"1984",
                              "release_date(2i)"=>"10",
                              "release_date(3i)"=>"26",
                              "director"=>"Test Director"}}
    end  
    it 'should update the movie director field'
    it 'should make the update results available to the index view'
  end
=end
end

