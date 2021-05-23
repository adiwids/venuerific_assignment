module RakeHelper
  def self.ask(question, if_empty = '')
    print "#{question} : "
    var = STDIN.gets.chomp

    !var.to_s.blank? ? var : if_empty
  end
end

namespace :admin do
  desc "Create user with administrator role"
  task create_user: :environment do
    start = Time.now.to_f
    puts "== admin:create_user"
    email = RakeHelper.ask('Email', '')
    password = RakeHelper.ask('Password', '')
    fail "-- Empty password is not allowed" if password.blank?
    password_conf = RakeHelper.ask('Re-type password', '')
    fail "-- Password doesn't match." unless password.eql?(password_conf)
    role = User::ROLES[:administrator]
    admin_user = User.where(email: email, role: role).first_or_initialize
    admin_user.password = password
    admin_user.password_confirmation = password_conf
    puts '------------------------'
    puts "Confirm entered data :"
    puts '------------------------'
    puts "  Email : #{email}"
    puts "  Password : #{password}"
    puts "  Role : #{role}"
    puts '------------------------'
    confirm_to_create = RakeHelper.ask("Are you sure to create this user? (Y/n)", 'n')
    if confirm_to_create.eql?('Y')
      if admin_user.save
        puts "-- Done"
        puts "   -> #{(Time.now.to_f - start).round(5)}s"
      else
        fail "-- Unable to create #{role}: #{admin_user.errors.full_messages.first}"
      end
    else
      puts "-- Cancelled"
    end
  end
end
