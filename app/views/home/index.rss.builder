xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title ENV["BLOG_TITLE"]
    xml.description ENV["BLOG_DESCRIPTION"]
    xml.link ENV["HOST_URL"]

@posts.each do |post|
  xml.item do
    xml.title post.title
    xml.description post.body
    xml.pubDate post.created_at.to_s(:rfc822)
    xml.link "/posts/#{post.slug}"
    xml.guid "/posts/#{post.slug}"
    xml.icon "/favicon.ico"
   end
end
end
end