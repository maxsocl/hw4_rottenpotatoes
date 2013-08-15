require "spec_helper"

describe MoviesController do
  describe "Update movie director info" do 
    it "should call update method"
    it "should render show view"
    it "should assing instance variable for the show view"
  end

  describe "Find movie by director" do
    it "should call find_similar Movie method" do
      movies = [mock('Movie'), mock('Movie')]
      mock = mock('Movie')
      mock.stub!(:director).and_return('mock director')
      Movie.should_receive(:find_similar).with('3').
          and_return(movies)
      Movie.stub(:find).and_return(mock)

      get :similar, {:id => '3'}
    end

    it "should choise similar view for rendering" do
      movies = [mock('Movie'), mock('Movie')]
      mock = mock('Movie')
      mock.stub!(:director).and_return('mock director')
      Movie.stub(:find_similar).and_return(movies)
      Movie.stub(:find).and_return(mock)
      get :similar, {:id => '3'}
      response.should render_template('similar')
    end

    it "should create instanse variable for similar view" do
      movies = [mock('Movie'), mock('Movie')]
      mock = mock('Movie')
      mock.stub!(:director).and_return('mock director')
      Movie.stub(:find_similar).and_return(movies)
      Movie.stub(:find).and_return(mock)
      Movie.stub(:director).and_return('Max')
      get :similar, {:id => '3'}
      assigns(:movies_list).should == movies
    end
  end

  describe "can't find similar movies if we don't know director" do
    it "should redirect to home view" do
      mock = mock('Movie')
      mock.stub!(:director).and_return('')
      mock.stub!(:title).and_return('Max')
      Movie.stub(:find).and_return(mock)
      get :similar, {:id => '3'}
      response.should redirect_to(movies_path)
    end

    it "should assing variable with 'Title' has no director info" do
      mock = mock('Movie')
      mock.stub!(:director).and_return('')
      mock.stub!(:title).and_return('Max')
      Movie.stub(:find).and_return(mock)
      get :similar, {:id => '3'}
      assigns(:error).should == 'Max'
    end
  end
end