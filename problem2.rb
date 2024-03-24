def parse_invoice_entries(text)
  entries = []
  pattern = /\[(\d{4}-\d{2}-\d{2})\] - (\w+) - (.+?) - (\$\d+(\.\d{2})?)/

  text.each_line do |line|
    match_data = line.match(pattern)
    if match_data
      date = match_data[1]
      number = match_data[2]
      client = match_data[3]
      amount = match_data[4]

      entries << {
        invoice_date: date,
        invoice_number: number,
        client_name: client,
        invoice_amount: amount
      }
    end
  end

  entries
end


invoice_entries_text = <<~TEXT
[2024-03-23] - INV001 - Client A Inc. - $500.00
[2024-03-24] - INV002 - Client B Corporation - $750.25
[2024-03-25] - INV003 - Client C Ltd. - $1000.50
TEXT

entries = parse_invoice_entries(invoice_entries_text)
entries.each do |entry|
  puts "Invoice Date: #{entry[:invoice_date]}"
  puts "Invoice Number: #{entry[:invoice_number]}"
  puts "Client Name: #{entry[:client_name]}"
  puts "Invoice Amount: #{entry[:invoice_amount]}"
  puts "-" * 30
end
