module S3Helper
  def presigned_post
    @bucket ||= Aws::S3::Resource.new.bucket(ENV.fetch("S3_BUCKET"))
    post = @bucket.presigned_post(
      allow_any: ['key'],
      success_action_status: "201",
      acl: "public-read"
      )
    
    return {
      fields: post.fields,
      host: URI.parse(post.url).host,
      url: post.url
    }.to_json
    
  end
end
