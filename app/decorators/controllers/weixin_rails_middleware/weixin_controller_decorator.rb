# encoding: utf-8
# 1, @weixin_message: 获取微信所有参数.
# 2, @weixin_public_account: 如果配置了public_account_class选项,则会返回当前实例,否则返回nil.
# 3, @keyword: 目前微信只有这三种情况存在关键字: 文本消息, 事件推送, 接收语音识别结果
WeixinRailsMiddleware::WeixinController.class_eval do
  include Rails.application.routes.url_helpers
  
  def server_path
    "http://test.nosweetnopay.com"
  end

  def reply
    render xml: send("response_#{@weixin_message.MsgType}_message", {})
  end

  private

    def response_text_message(options={})
      if @keyword == "test"
        link = "<a href='#{server_path}/mobile?open_id=#{@weixin_message.FromUserName}'> 商城入口</a>"
        reply_text_message(link)
      elsif @keyword.upcase.index("CX")==0
        keyword = @keyword.upcase.delete("CX").strip
        @products = Product.where("keywords like ? or name like ?","%#{keyword}%","%#{keyword}%")
        arts = []
        if @products.size >0
          @products.each do |product|
            art = generate_article(product.name, product.pdt_desc, server_path+"#{product.good.icon_url(:normal)}", mobile_product_url(product))
            logger.info art.to_xml
            arts << art
          end
          reply_news_message(arts)
        else
          reply_text_message("查询无相关商品: #{keyword}")
        end
        
      elsif @keyword.upcase.index("ZX")==0
        keyword = @keyword.upcase.delete("ZX").strip
        @articles = Article.where("keywords like ? or title like ?","%#{keyword}%","%#{keyword}%")
        arts = []
        if @articles.size >0
          @articles.each do |article|
            art = generate_article(article.title, article.breif, server_path+"#{article.cover_url(:normal)}", mobile_article_url(article))
            logger.info art.to_xml
            arts << art
          end
          reply_news_message(arts)
        else
          reply_text_message("查询无相关资讯: #{keyword}")
        end
      elsif @keyword == "diaocha"
        link = "<a href='http://jinshuju.net/f/fTYCcx'>客户满意度调查表</a>"
        reply_text_message(link)
      else
        reply_text_message("")
      end
    end

    # <Location_X>23.134521</Location_X>
    # <Location_Y>113.358803</Location_Y>
    # <Scale>20</Scale>
    # <Label><![CDATA[位置信息]]></Label>
    def response_location_message(options={})
      @lx    = @weixin_message.Location_X
      @ly    = @weixin_message.Location_Y
      @scale = @weixin_message.Scale
      @label = @weixin_message.Label
      reply_text_message("Your Location: #{@lx}, #{@ly}, #{@scale}, #{@label}")
    end

    # <PicUrl><![CDATA[this is a url]]></PicUrl>
    # <MediaId><![CDATA[media_id]]></MediaId>
    def response_image_message(options={})
      @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
      @pic_url  = @weixin_message.PicUrl  # 也可以直接通过此链接下载图片, 建议使用carrierwave.
      reply_image_message(generate_image(@media_id))
    end

    # <Title><![CDATA[公众平台官网链接]]></Title>
    # <Description><![CDATA[公众平台官网链接]]></Description>
    # <Url><![CDATA[url]]></Url>
    def response_link_message(options={})
      @title = @weixin_message.Title
      @desc  = @weixin_message.Description
      @url   = @weixin_message.Url
      reply_text_message("回复链接信息")
    end

    # <MediaId><![CDATA[media_id]]></MediaId>
    # <Format><![CDATA[Format]]></Format>
    def response_voice_message(options={})
      @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
      @format   = @weixin_message.Format
      # 如果开启了语音翻译功能，@keyword则为翻译的结果
      # reply_text_message("回复语音信息: #{@keyword}")
      reply_voice_message(generate_voice(@media_id))
    end

    # <MediaId><![CDATA[media_id]]></MediaId>
    # <ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
    def response_video_message(options={})
      @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
      # 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
      @thumb_media_id = @weixin_message.ThumbMediaId
      reply_text_message("回复视频信息")
    end

    def response_event_message(options={})
      event_type = @weixin_message.Event
      send("reply_#{event_type.downcase}_event")
    end

    private

      # 关注公众账号
      def reply_subscribe_event
        if @keyword.present?
          # 扫描带参数二维码事件: 1. 用户未关注时，进行关注后的事件推送
          return reply_text_message("扫描带参数二维码事件: 1. 用户未关注时，进行关注后的事件推送, keyword: #{@keyword}")
        end
        reply_text_message("关注公众账号")
      end

      # 取消关注
      def reply_unsubscribe_event
        Rails.logger.info("取消关注")
      end

      # 扫描带参数二维码事件: 2. 用户已关注时的事件推送
      def reply_scan_event
        reply_text_message("扫描带参数二维码事件: 2. 用户已关注时的事件推送, keyword: #{@keyword}")
      end

      def reply_location_event # 上报地理位置事件
        @lat = @weixin_message.Latitude
        @lgt = @weixin_message.Longitude
        @precision = @weixin_message.Precision
        reply_text_message("Your Location: #{@lat}, #{@lgt}, #{@precision}")
      end

      # 点击菜单拉取消息时的事件推送
      def reply_click_event
        if @keyword == "BUTTON_BUY"          
          arts = []
          art = generate_article("上理果园", "点击进入商城", "", mobile_root_url)
          arts << art
          reply_news_message(arts)
        else
            @articles = Article.where("keywords = ?",@keyword)
            arts = []
            if @articles.size >0
              @articles.each do |article|
                art = generate_article(article.title, article.breif, server_path+"#{article.cover_url(:normal)}", mobile_article_url(article))
                logger.info art.to_xml
                arts << art
              end
              reply_news_message(arts)
            else
              reply_text_message("按钮可能已经失效，请联系客户人员")
            end
        end
        
        
      end

      # 点击菜单跳转链接时的事件推送
      def reply_view_event
        Rails.logger.info("你点击了: #{@keyword}")
      end

end
