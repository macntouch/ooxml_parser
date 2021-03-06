require_relative '../common_parser/common_data/ooxml_document_object'
require_relative 'docx_data/document_structure'

module OoxmlParser
  class DocxParser
    def self.parse_docx(path_to_file)
      Parser.parse_format(path_to_file) do
        DocumentStructure.parse
      end
    end
  end
end
