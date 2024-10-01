require "json"

# 현재 gemspec 파일 위치 기준으로 package.json 파일을 찾아 경로를 지정합니다.
package_json_path = File.join(File.dirname(__FILE__), "package.json")
package_json = JSON.parse(File.read(package_json_path))

Gem::Specification.new do |spec|
  spec.name                    = "minimal-mistakes-jekyll"
  spec.version                 = package_json["version"]
  spec.authors                 = package_json["author"]

  spec.summary                 = package_json["description"]
  spec.description             = package_json["description"]
  spec.homepage                = package_json["homepage"]
  spec.license                 = package_json["license"]

  spec.metadata["plugin_type"] = "theme"

  # 파일 목록은 git ls-files를 통해 자동으로 포함시킵니다.
  spec.files                   = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_(data|includes|layouts|sass)/|(LICENSE|README|CHANGELOG)((\.(txt|md|markdown)|$)))}i)
  end

  # 런타임 종속성 추가
  spec.add_runtime_dependency "jekyll", ">= 3.7", "< 5.0"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.3"
  spec.add_runtime_dependency "jekyll-gist", "~> 1.5"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.1"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0.1"

  # 개발 종속성
  spec.add_development_dependency "bundler", ">= 1.15"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
