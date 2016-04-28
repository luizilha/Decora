class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamento do |t|

      t.timestamps
    end
  end
end
