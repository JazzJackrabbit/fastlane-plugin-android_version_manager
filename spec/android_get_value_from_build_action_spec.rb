require 'spec_helper'

describe Fastlane::Actions::AndroidGetValueFromBuildAction do
  def execute_lane_test(dir: '../**/app', key: nil)
    params = [
      "app_project_dir: \"#{dir}\","
    ]

    params.push("key: \"#{key}\",") unless key.nil?

    Fastlane::FastFile.new.parse("lane :test do
      android_get_value_from_build(
        #{params.join("\n")}
      )
    end").runner.execute(:test)
  end

  describe "Get def variable" do
    it "should return defVersionName from build.gradle" do
      result = execute_lane_test(key: "defVersionName")
      expect(result).to eq("1.0.0")
    end
  end

  describe "Get versionName property" do
    it "should return versionName from build.gradle" do
      result = execute_lane_test(key: "versionName")
      expect(result).to eq("1.0.0")
    end
  end
end
