require 'minitest/spec'

describe_recipe "force-unlink::default" do
  it "sets permissions properly" do
    file(node["force-unlink"]["target"]).must_exist.with(:mode, "0755")
  end
end
