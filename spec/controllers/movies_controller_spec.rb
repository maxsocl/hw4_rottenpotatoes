require "spec_helper"

describe MoviesController do
  describe "Update movie director info"
    it "should call update method" do
    end
    it "should render show view"
    it "should assing instance variable for the show view"

  describe "Find movie by director" do
    it "should call find_similar Movie method" do
      movies = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find_similar).with('3').
          and_return(movies)
      Movie.stub(:find).and_return(mock('Movie'))
      get :similar, {:id => '3'}
    end

    it "should choise similar view for rendering" do
      movies = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_similar).and_return(movies)
      Movie.stub(:find).and_return(mock('Movie'))
      get :similar, {:id => '3'}
      response.should render_template('similar')
    end

    it "should create instanse variable for similar view" do
      movies = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_similar).and_return(movies)
      Movie.stub(:find).and_return(mock('Movie'))
      get :similar, {:id => '3'}
      assigns(:movies_list).should == movies
    end
  end
end