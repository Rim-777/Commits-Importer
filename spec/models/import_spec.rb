# require 'rails_helper'
#
# RSpec.describe Import, type: :model do
#
#
#   describe '#import!' do
#
#     it 'should  receive get for RestClient class' do
#       expect(RestClient).to receive(:get).with("https://api.github.com/repos/Rim-777/AskmeHow/commits?page=1")
#       Import.new('Rim-777', 'AskmeHow').import!
#       end
#
#     it 'should  receive parse for JSON class' do
#       expect(JSON).to receive(:parse)
#       Import.new('Rim-777', 'AskmeHow').import!
#     end
#     #
#     it 'should  receive destroy_all for User class' do
#       expect(User).to receive(:destroy_all)
#       Import.new('Rim-777', 'AskmeHow').import!
#     end
#     #
#     it 'should  save all commits in database' do
#       Import.new('Rim-777', 'AskmeHow').import!
#       expect(Commit.all.size).to eq(220)
#     end
#   end
#
# end
