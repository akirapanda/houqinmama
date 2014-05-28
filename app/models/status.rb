class Status < ActiveRecord::Base
  belongs_to :statusable, :polymorphic => true
  belongs_to :user
end