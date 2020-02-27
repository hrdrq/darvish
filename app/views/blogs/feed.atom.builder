br_node = Nokogiri::HTML.fragment('</br>') 

atom_feed({'xml:lang' => "zh-TW"}) do |feed|
  feed.title("達比修有台灣粉絲網")
  feed.updated(@blogs[0].created_at) if @blogs.length > 0

  @blogs.each do |blog|

    content_modified = Nokogiri::HTML.fragment(blog.content) 
    content_modified.css('onpu,nihihi,niko,up,shock,punch,ase,aseru,down,beda,exc,gan,love,shobon,good,hare,koinoya,ame,pa,dash,kao,bikuri,crack,me,hatena,mu,gokaku,choki,rocket,mera,gugu,yuki,doki,keshoheartbreak,lovelove,excque,muka,bomb,don,kiss,hirameki,dokuro,oyobi,pun,sira,et,kaze,tokuige,mimi,guu,asi').remove 
    content_modified.css('.jp').each do |node_jp|
      node_jp.after("<br>")
    end

    content_modified.css('t').each do |node|
      node.children.each do |child|
        node.after(child)
      end
      node.remove

    end
    content_modified.css('div').before("<h2>#{blog.dt}</h2>")
    
    
    #  nodes = content_modified.css('a')
    # unless nodes.nil?
    #   nodes.each do |node|
    #     node.children.each do |child|
    #       node.after(child)
    #     end
    #     node.remove
    #   end
    # end
    title = Nokogiri::HTML.fragment(blog.title) 
    # title_modified.css('t.jp').remove 
    # node = title_modified.at('t')
    
    # node.children.each do |child|
    #   node.parent << child
    # end
    # node.remove

   


    feed.entry(blog, :url => blog_url(blog)) do |entry|
      entry.title("#{title.css('t.jp').text}／#{title.css('t.tw').text}")
      entry.content(content_modified, type: 'html')

      entry.author do |author|
        author.name("達比修有台灣粉絲網")
      end
    end
  end
end