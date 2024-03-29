class HomeController < ApplicationController
  def index
    if current_user.root?
      redirect_to users_path
    else
      h = File.exist?("app/views/home/#{current_user.role.name.downcase}.haml") ? current_user.role.name.downcase : 'index'
      render h
    end
  end

  def random_pass
    pass = ''
    sep = [' ', '', '-', '_', '/', '*']
    words = File.readlines('lib/vocabulary')
    words.sample(10).each do |w|
      pass += char_shuffle(w.chomp) + sep[rand(sep.count-1)] if w.size > 3
      break if pass.size > 10
    end
    unless pass =~ /[0-9]/
      pass[rand(pass.size-1)] = rand(10).to_s
    end
    render json: { pass: pass }
  end

  private
  def char_shuffle(w)
    w = w[0] + w[1..-2].split(//).shuffle.join('') + w[-1]
    w[-1] = w[-1].upcase if rand(10) > 4
    w.gsub!(/i/i, '1') if rand(10) > 4
    w.gsub!(/o/i, '0') if rand(10) > 4
    w.size.times do |i|
      w[i] = w[i].swapcase if rand(10) > 4
    end
    return w
  end
end
