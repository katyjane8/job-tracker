require 'rails_helper'

 describe Comment do
   describe "validations" do
     context "invalid attributes" do
       it "is invalid without content" do
         comment = Comment.new(job_id: 1)
         expect(comment).to be_invalid
       end
     end
   end

     describe "relationships" do
       it "belongs to jobs" do
         comment = Comment.new(content: "hi", job_id: 1)
         expect(comment).to respond_to(:job)
       end
     end
 end
