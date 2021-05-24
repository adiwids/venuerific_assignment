require 'faker'

Rake::Task['admin:create_user'].reenable
Rake::Task['admin:create_user'].invoke

articles_count = ENV.fetch('ARTICLES_COUNT') { '1' }.to_i
if articles_count.positive?
  articles_count.times do |i|
    Article.create!(title: Faker::Movie.title,
                    content: Faker::Lorem.paragraph,
                    meta_keywords: %w(blog test article content).join(', '),
                    meta_description: Faker::Lorem.paragraph(sentence_count: 2),
                    published: true,
                    author_id: User.administrator.pluck(:id).sample)
    print "\rPublishing random article (#{i + 1})"
    sleep 1
  end
  puts "\nDone.\n"
end
