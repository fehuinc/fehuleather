module S3Helper
  def s3_presigned_post
    @post ||= S3_BUCKET.presigned_post(
      key: "#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      acl: 'public-read'
      )
  end
end
