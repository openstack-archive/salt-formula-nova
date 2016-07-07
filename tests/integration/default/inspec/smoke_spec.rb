
control "Check run_test.sh" do
  describe file('/tmp/kitchen/tests/run_tests.sh') do
    it {should be_file}
    it {should be_executable}
  end
end
