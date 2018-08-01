class Article < ApplicationRecord
    has_one :discount
    
    has_many :user_articles
    has_many :users, through: :user_articles
    
      def self.price(article_id, number)
        puts "calcular precio"
        article=Article.find(article_id)
        if article.discount_id
            discount=Discount.find(article.discount_id)
        else
            discount=''
        end
        price=subtotal(article,discount,number)
        puts price
        return price
      end
      
      def self.subtotal(article, discount, number)
        price= article.price
        
        if discount != ''
            new_price=new_price (discount, price)
            if discount.typediscount == "minimum quantity"
                puts "minimum quantity"
                if number.to_i >= discount.quantity.to_i
                    puts 'number higher'
                    subtotal=number.to_i * new_price
                else
                    puts 'number lower'
                    subtotal=number.to_i * article.price.to_f
                end
            else
                puts "round units"
                if ((number.to_i % discount.quantity.to_i) == 0) then
                    puts 'number perfect match'
                    subtotal= number.to_i * new_price
          		else 
          		    puts 'number exceed'
          		    puts "#{(number.to_i / discount.quantity.to_i)}"
          		    puts "#{(number.to_i % discount.quantity.to_i)}"
          			subtotal =  (number.to_i- (number.to_i % discount.quantity.to_i)) * new_price + (number.to_i % discount.quantity.to_i)*article.price.to_f
          		end
            end
        else
            puts 'without discount'
            subtotal=number.to_i * article.price.to_f
        end
        puts 'subtotal'
        return subtotal
      end
      
      def self.new_price (discount, price)
          if discount.unitdiscount == '%'
              new_price = discount.price.to_f * price / 100
          else
              new_price = discount.price.to_f
            end
      end
end
