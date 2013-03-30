require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',     text: heading)}
    it { should have_selector('title',  text: page_title)}
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'Sample App' }
    let(:page_title)  { 'Ruby on Rails Tutorial Sample App' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Help' }
    let(:page_title)  { 'Ruby on Rails Tutorial Sample App | Help' }
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'About' }
    let(:page_title)  { 'Ruby on Rails Tutorial Sample App | About Us' }
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     { 'Contact' }
    let(:page_title)  { 'Ruby on Rails Tutorial Sample App | Contact' }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App | About Us'
    click_link "Help"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App | Help'
    click_link "Contact"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App | Contact'
    click_link "Home"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App'
    click_link "Sign up now!"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App | Sign up'
    click_link "sample app"
    page.should have_selector 'title', text: 'Ruby on Rails Tutorial Sample App'
  end
end