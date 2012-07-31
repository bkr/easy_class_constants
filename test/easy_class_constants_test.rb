require "test_helper"

class EasyClassConstantsTest < Test::Unit::TestCase
  class ECCTestObject
    include EasyClassConstants
    
    readable_constant :read_only, 'R'
    writable_constant :write_only, 'W'
    accessible_constant :read_write, 'RW'
    hash_indexed_by_readable_constants(:mapping, [[:internal_error, 0, 'Internal Error - Try Again Later'],
                                            [:network_error, 1, 'Network Error - Check With Your Admin']])

    hash_indexed_by_readable_constants(:simple_mapping, [[:HELLO_WORLD, 'Hello World'],
                                            [:HELLO_KITTY, 'Hello Kitty']])
                                        
  end
  
  context "hash_indexed_by_readable_constants" do
    context "with 3 arg mapping" do
      should "create readable constant from created hash" do
        assert_equal 'Internal Error - Try Again Later', ECCTestObject.MAPPING[0]
        assert_equal 'Network Error - Check With Your Admin', ECCTestObject.MAPPING[1]
      end

      should "create constants for each constant name" do
        assert_equal 0, ECCTestObject.INTERNAL_ERROR
        assert_equal 1, ECCTestObject.NETWORK_ERROR
      end      
    end
    
    context "with 2 arg mapping" do
      should "create readable constant from created hash" do
        assert_equal 'Hello World', ECCTestObject.SIMPLE_MAPPING[:HELLO_WORLD]
        assert_equal 'Hello Kitty', ECCTestObject.SIMPLE_MAPPING[:HELLO_KITTY]
      end
      
      should "create constants for each constant name" do
        assert_equal 'Hello World', ECCTestObject.HELLO_WORLD
        assert_equal 'Hello Kitty', ECCTestObject.HELLO_KITTY
      end
    end
  end
  
  context "readable_constant" do
    should "be readable" do
      assert_equal 'R', ECCTestObject.READ_ONLY
    end
    
    should "not be writeable" do
      assert_raise(NoMethodError) { ECCTestObject.READ_ONLY = 1 }
    end
  end
  
  context "writable_constant" do
    should "not be readable" do
      assert_raise(NoMethodError) { ECCTestObject.WRITE_ONLY }
    end
    
    should "be writeable" do
      ECCTestObject.WRITE_ONLY = 1
      assert_equal 1, ECCTestObject.send(:class_variable_get, '@@WRITE_ONLY')
    end  
  end
  
  context "accessible_constant" do
    should "be readable" do
      assert_equal 'RW', ECCTestObject.READ_WRITE
    end

    should "be writeable" do
      ECCTestObject.READ_WRITE = 1
      assert_equal 1, ECCTestObject.READ_WRITE
    end    
  end
end