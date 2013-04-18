require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Observer#add_observer" do

  before(:each) do
    @observable = ObservableSpecs.new
    @observer = ObserverCallbackSpecs.new
    @custom_observer = ObserverCustomCallbackSpecs.new
  end

  it "adds the observer" do
    @observer.value.should == nil
    @observable.changed
    @observable.notify_observers("test")
    @observer.value.should == nil

    @observable.add_observer(@observer)
    @observable.changed
    @observable.notify_observers("test2")
    @observer.value.should == "test2"
  end

  it "supports custom method on observer" do
    @observable.add_observer(@custom_observer, :custom)
    @observable.changed
    @observable.notify_observers("test2")
    @custom_observer.value.should == "test2"
  end

end
