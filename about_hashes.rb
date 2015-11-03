require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size

    # key and values
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]
    assert_equal "dos", hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal "uno" , hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
    # When you want to raise an error
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => "eins", :two => "dos" }
    assert_equal expected, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
    # assigning varible to that hash 
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal true, hash1 == hash2

  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size
    assert_equal true, hash.keys.include?(:one)
    assert_equal true, hash.keys.include?(:two)
    assert_equal Array, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size
    assert_equal true, hash.values.include?("uno")
    assert_equal true, hash.values.include?("dos")
    assert_equal Array, hash.values.class
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal true, hash != new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    assert_equal true, expected == new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]
    assert_equal nil, hash1[:two]

    # nil because :two does not exist

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]
    assert_equal "dos", hash2[:two]

    # "dos" by default because not given anything
    # could be anything - i.e. hash2[:doggy], assert_equal will still equal to "dos"
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])
    # ([]) by default when it doesn't exist

    # default is its own thing
    # by default, it is an empty array
    # persists as an empty array

    hash[:one] << "uno"
    hash[:two] << "dos"

    # << push

    assert_equal ["uno", "dos"], hash[:one]

    # calling :one - empty array, putting "uno" in there, provided that :one and :two are given together

    assert_equal ["uno", "dos"], hash[:two]

    # same thing as above

    assert_equal ["uno", "dos"], hash[:three]

    # storing default array on hash everytime you reference something that doesn't exist
    # BY DEFAULT - literally

    assert_equal true, hash[:one].object_id == hash[:two].object_id
  end

  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    # access to hash itself and the key that was just passed in
    # |hash, key| = arguments for block
    # hash[key] = putting key into the hash *remember to read para first
    # |hash, key| hash[key] = only matter within those brackets, how this behave when key does not exist

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ["uno"], hash[:one]
    # asking for hash[:one], :one is key, passing through actually hash
    # since empty array, by default it is "uno"

    assert_equal ["dos"], hash[:two]
    # same as above
    assert_equal [], hash[:three]
    # :three does not exist so it ends with [] - empty array

    # block 
  end
end
