module Buildium
  class FileUploader < Buildium::Base
    def self.upload_file(file, params, auth)
      file_upload_request = Buildium::FileUploadRequest.create(params, auth)

      form_data = {}
      aws_info = file_upload_request.data[:form_data]
      aws_info.each_key do |key|
        new_key = key.to_s.split('_').map(&:capitalize).join('-')
        form_data[new_key] = aws_info[key]
      end
      form_data[:file] = file

      Typhoeus::Request.new(
        file_upload_request.data[:bucket_url],
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json'
        },
        method: :post,
        body: form_data
      ).run
    end
  end
end
