class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|

      t.timestamps
    end
  end
end
