class ExceptionBlacklist
  def self.path_on_404_blacklist(path)
    # Temporarily nonexistent
    return true if path.start_with? "/blog"
    return true if path.start_with? "/checkout"

    # Noisy subsystems
    return true if path.start_with? "/assets/application-"
    
    # Nonsense requests
    return true if path == "/magazine/js/mage/cookies.js"
    return true if path.start_with? "/admin"
    return true if path.start_with? "/apple-app-site-association"
    return true if path.start_with? "/.well-known/apple-app-site-association"
    return true if path.start_with? "/downloader"
    return true if path.start_with? "/sitemap"
    return true if path.start_with? "/wordpress"
    return true if path.start_with? "/wp-"
    return true if path.start_with? "/z3/"
    return true if path.include? ".php"
    return true if path.include? "fckeditor"
  end
end
