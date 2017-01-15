class ExceptionBlacklist
  def self.path_on_404_blacklist(path)
    # Noisy subsystems
    return true if path.start_with? "/assets/application-"
    
    # Nonsense requests
    return true if path.start_with? "/.well-known"
    return true if path.start_with? "/admin"
    return true if path.start_with? "/apple-app-site-association"
    return true if path.start_with? "/apple-touch-icon"
    return true if path.start_with? "/backup"
    return true if path.start_with? "/blog"
    return true if path.start_with? "/browserconfig.xml"
    return true if path.start_with? "/database"
    return true if path.start_with? "/downloader"
    return true if path.start_with? "/favicon.ico"
    return true if path.start_with? "/magazine/js"
    return true if path.start_with? "/sitemap"
    return true if path.start_with? "/sql"
    return true if path.start_with? "/wordpress"
    return true if path.start_with? "/wp-"
    return true if path.start_with? "/z3/"
    return true if path.include? ".php"
    return true if path.include? ".sql"
    return true if path.include? ".zip"
    return true if path.include? ".tar"
    return true if path.include? "fckeditor"
    
    return false
  end
end
