require 'hbaserb'

client = HBaseRb::Client.new 'db'

table = client.get_table "test"
row = table.get_row("2").first

p row.columns["fam1:hoge"].value
p row.columns["fam1:fuga"].value
p row.columns["fam2:count"].value
