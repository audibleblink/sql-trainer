describe "TableInfo" do

  context "#schema_for" do

    let(:schema) { TableInfo.schema_for("tracks") }

    it "returns the schema for a given table" do
      expect(schema).to have_key :table_name
      expect(schema).to have_key :fields
    end

  end

end
