class AssistantController < ApplicationController
  def messenger
  	puts(params)
    query = params[:palavra_chave]
    page = WikipediaConsulter.find_by_name(query)

    if page.text.present?
      text = "#{page.text.slice(0, 150)}... \b link completo: #{page.fullurl}"
    else
      text = "Não encontrei essa página na Wikipedia em inglês :("
    end

    response =
    {
      "speech": text,
      "displayText": text,
      "data": "",
      "source": "Programming Assitant"
    }

    render json: response
  end
end